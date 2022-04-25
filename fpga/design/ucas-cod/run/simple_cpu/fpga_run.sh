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

SW_ELF_BIN=./software/workload/ucas-cod/host/$2/elf/loader_$CNT

BENCH_PATH=./software/workload/ucas-cod/benchmark/simple_test
BENCH_SUITE=$1
ARCH=$3

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

sleep 2

if [ `cat $CONFIGFS_PATH/status` != "1" ]; then
  echo "FPGA configuration failed, Please retry this job."
  exit 1
fi

echo "Completed FPGA configuration"

#=============================#
# Step 2: Software evaluation #
#=============================#
if [ ! -d $BENCH_PATH/$BENCH_SUITE ]; then
  echo "Incorrect bench suite name, should be one of basic medium advanced microbench hello"
fi

N_PASSED=0
N_TESTED=0

for bench in `ls $BENCH_PATH/$BENCH_SUITE/$ARCH/elf`; do
  #Launching benchmark in the list
  echo "Launching ${bench} benchmark..."

  if [ "$BENCH_SUITE" = "microbench" ] || [ "$BENCH_SUITE" = "hello" ] || [ "$BENCH_SUITE" = "dnn_test" ] || [ "$BENCH_SUITE" = "dma_test" ]
  then
	  UART="uart 2"
  fi

  $SW_ELF_BIN $BENCH_PATH/$BENCH_SUITE/$ARCH/elf/$bench $UART
  RESULT=$?

  if [ $RESULT -eq 0 ]; then
    echo "Hit good trap"
    N_PASSED=$(expr $N_PASSED + 1)
  else
    echo "Hit bad trap"
  fi

  N_TESTED=$(expr $N_TESTED + 1)
done

echo "pass $N_PASSED / $N_TESTED"

#=============================#
# Step 3: Environment cleanup #
#=============================#
#rmdir $CONFIGFS_PATH
#rm -f $FIRMWARE_PATH/$BIT_FILE_BIN
echo 0 > $CONFIGFS_PATH/status

#=======================
# Step 4: Check if all benchmarks passed
#=======================
if [ "$N_PASSED" -ne "$N_TESTED" ]
then
        exit -1
fi

if [ $N_PASSED -eq 0 ]
then
        exit -1
fi
