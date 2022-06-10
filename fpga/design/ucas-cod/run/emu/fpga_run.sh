#!/bin/env bash

#======================#
# Step 0: Get Role cnt #
#======================#
CNT=

for i in {0..4}; do
  LOCK_FILE=/run/role_$i.lock
  exec {LOCK_FD}<>$LOCK_FILE
  if flock -n $LOCK_FD; then
    CNT=$i
    echo "RUNNER_CNT = $CNT"
    break
  fi
done

if [ -z $CNT ]; then
  echo Please retry this job!
  exit 1
fi

#======================#

BIT_FILE_BIN=role_$CNT.bit.bin
BIT_FILE=./hw_plat/ucas-cod_nf/$BIT_FILE_BIN

FIRMWARE_PATH=/lib/firmware

MANAGER_PATH=/sys/class/fpga_manager/fpga0

CONFIGFS_PATH=/sys/kernel/config/device-tree/overlays/role_$CNT

if [[ $EMU_BENCH_SUITE == "coremark" || $EMU_BENCH_SUITE == "dhrystone" ]]; then
  BENCH_ELF=software/workload/ucas-cod/benchmark/perf_test/$EMU_BENCH_SUITE/$CPU_ISA/elf/$EMU_BENCH_NAME
  BENCH_BIN=software/workload/ucas-cod/benchmark/perf_test/$EMU_BENCH_SUITE/$CPU_ISA/bin/$EMU_BENCH_NAME.bin
else
  BENCH_ELF=software/workload/ucas-cod/benchmark/simple_test/$EMU_BENCH_SUITE/$CPU_ISA/elf/$EMU_BENCH_NAME
  BENCH_BIN=software/workload/ucas-cod/benchmark/simple_test/$EMU_BENCH_SUITE/$CPU_ISA/bin/$EMU_BENCH_NAME.bin
fi

if [ -f $BENCH_ELF ]; then
  echo "Using benchmark $EMU_BENCH_SUITE:$EMU_BENCH_NAME"
  objcopy -S -I elf32-little -O binary $BENCH_ELF $BENCH_BIN
fi

EMU_CONFIG=software/workload/ucas-cod/host/emu/config/role_$CNT.yml
EMU_CKPT_PATH=fpga/emu_out/ckpt_store
EMU_DUMP_PATH=fpga/emu_out/dump

#============================#
# Step 1: FPGA configuration #
#============================#
# Step 1.1 check status
if [ `cat $CONFIGFS_PATH/status` != "0" ]; then
  echo 0 > $CONFIGFS_PATH/status
  sleep 2
fi

# Step 1.2 Copy .bit.bin and .dtbo to firmware path
if [ ! -e $BIT_FILE ]; then
  echo "Error: No binary bitstream file is ready"
  exit -1
fi

cp $BIT_FILE $FIRMWARE_PATH

# Step 1.3 configuration of fpga role
echo 1 > $CONFIGFS_PATH/status

sleep 2

if [ `cat $CONFIGFS_PATH/status` != "1" ]; then
  echo "FPGA configuration failed, Please retry this job."
  exit 1
fi

echo "Completed FPGA configuration"

#=============================#
# Step 2: Software evaluation #
#=============================#
RESULT=1

if [ $SIM_DUT_TYPE == "turbo" ]; then
  TURBO="--turbo"
fi

if [ -f $BENCH_BIN ]; then

  source /opt/rh/rh-python38/enable
  export PYTHONPATH=$PWD/software/workload/ucas-cod/host/emu:${PYTHONPATH:+:${PYTHONPATH}}
  export PYTHONUNBUFFERED=1

  python3 software/workload/ucas-cod/host/emu/firewall.py --check --unblock $CNT

  rm -rf $EMU_CKPT_PATH
  if [ $EMU_MANUAL_REPLAY_ENABLE == "yes" ]; then
    python3 software/workload/ucas-cod/host/emu/run_emu.py \
      --initmem emu_top.u_rammodel.host_axi $BENCH_BIN \
      --to $EMU_MANUAL_REPLAY_BEGIN \
      --dump $EMU_DUMP_PATH \
      $EMU_CONFIG $EMU_CKPT_PATH
  else
    python3 software/workload/ucas-cod/host/emu/run_emu.py \
      --initmem emu_top.u_rammodel.host_axi $BENCH_BIN \
      --timeout $EMU_TIMEOUT \
      --rewind $EMU_REPLAY_WINDOW \
      --dump $EMU_DUMP_PATH \
      $TURBO \
      $EMU_CONFIG $EMU_CKPT_PATH
  fi
  RESULT=$?

  python3 software/workload/ucas-cod/host/emu/firewall.py --check $CNT

else
  echo "Error: Benchmark $EMU_BENCH_SUITE:$EMU_BENCH_NAME is not found"
fi

#=============================#
# Step 3: Environment cleanup #
#=============================#
#rmdir $CONFIGFS_PATH
#rm -f $FIRMWARE_PATH/$BIT_FILE_BIN
echo 0 > $CONFIGFS_PATH/status

if [ $RESULT -ne 0 ]; then
        exit 1
fi
