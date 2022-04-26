#!/bin/env bash

CNT_FILE="/root/cnt"
LOCK_FILE="/root/lock"

#======================#
# Step 0: Get Role cnt #
#======================#
while true
do
        if [ ! -f $LOCK_FILE ];then
                echo $$>$LOCK_FILE
                break
        else
                sleep 1
                echo lock
        fi
done

PID=`cat $LOCK_FILE`

if [ $PID != $$ ];then
        echo "Please retry this job!"
        exit 1;
fi

if [ -f $CNT_FILE ];then
        CNT=`cat $CNT_FILE`
        if (( $CNT < 4 ));then
                CNT_NEXT=`expr $CNT + 1`
        else
                CNT_NEXT=0
        fi
        echo $CNT_NEXT > $CNT_FILE
        echo "RUNNER_CNT = $CNT"
else
        echo 0 > $CNT_FILE
        CNT=`cat $CNT_FILE`
        echo "RUNNER_CNT = $CNT"
fi

rm -f $LOCK_FILE

#======================#

BIT_FILE_BIN=role_$CNT.bit.bin
BIT_FILE=./hw_plat/ucas-cod_nf/$BIT_FILE_BIN

FIRMWARE_PATH=/lib/firmware

MANAGER_PATH=/sys/class/fpga_manager/fpga0

CONFIGFS_PATH=/sys/kernel/config/device-tree/overlays/role_$CNT

BENCH_BIN=software/workload/ucas-cod/benchmark/simple_test/$EMU_BENCH_SUITE/$CPU_ISA/bin/$EMU_BENCH_NAME.bin

EMU_CONFIG=software/workload/ucas-cod/host/emu/config/role_$CNT.yml
EMU_CKPT_PATH=fpga/emu_out/ckpt_store
EMU_DUMP_PATH=fpga/emu_out/dump

#============================#
# Step 1: FPGA configuration #
#============================#
# Step 1.1 Copy .bit.bin and .dtbo to firmware path
if [ ! -e $BIT_FILE ]; then
  echo "Error: No binary bitstream file is ready"
  exit -1
fi

cp $BIT_FILE $FIRMWARE_PATH

# Step 1.2 configuration of fpga role
echo 1 > $CONFIGFS_PATH/status

echo "Completed FPGA configuration"

#=============================#
# Step 2: Software evaluation #
#=============================#
if [ -f $BENCH_BIN ]; then

  source /opt/rh/rh-python38/enable
  export PYTHONPATH=$PWD/software/workload/ucas-cod/host/emu:${PYTHONPATH:+:${PYTHONPATH}}
  export PYTHONUNBUFFERED=1

  python3 software/workload/ucas-cod/host/emu/firewall.py --check --unblock $CNT

  rm -rf $EMU_CKPT_PATH
  if [ $EMU_MANUAL_REPLAY_ENABLE == "yes" ]; then
    python3 -m monitor \
      --initmem emu_top.u_rammodel.host_axi $BENCH_BIN \
      --to $EMU_MANUAL_REPLAY_BEGIN \
      --dump $EMU_DUMP_PATH \
      $EMU_CONFIG $EMU_CKPT_PATH
  else
    python3 -m monitor \
      --initmem emu_top.u_rammodel.host_axi $BENCH_BIN \
      --timeout $EMU_TIMEOUT \
      --rewind $EMU_REPLAY_WINDOW \
      --dump $EMU_DUMP_PATH \
      $EMU_CONFIG $EMU_CKPT_PATH
  fi

  python3 software/workload/ucas-cod/host/emu/firewall.py --check $CNT

else
  echo "Incorrect benchmark suite or name"
fi

#=============================#
# Step 3: Environment cleanup #
#=============================#
#rmdir $CONFIGFS_PATH
#rm -f $FIRMWARE_PATH/$BIT_FILE_BIN
echo 0 > $CONFIGFS_PATH/status
