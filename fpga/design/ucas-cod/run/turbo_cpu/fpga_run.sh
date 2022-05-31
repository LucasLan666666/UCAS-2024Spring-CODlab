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

SW_ELF_BIN=./software/workload/ucas-cod/host/$2/elf/loader_$CNT

BENCH_PATH=./software/workload/ucas-cod/benchmark/perf_test
BENCH_SUITE=`echo $1 | awk -F ":" '{print $1}'`
ARCH=$3

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
if [ ! -d $BENCH_PATH/$BENCH_SUITE ]; then
  echo "Incorrect bench suite name, should be either coremark or dhrystone"
fi

N_PASSED=0
N_TESTED=0

BENCH_TEST=`echo $1 | awk -F ":" '{print $2}'`

if [[ $BENCH_TEST = "" ]]
then
BENCH=`ls $BENCH_PATH/$BENCH_SUITE/$ARCH/elf`
else
BENCH=${BENCH_TEST}
fi

for bench in ${BENCH}; do
  #Launching benchmark in the list
  echo "Launching ${bench} benchmark..."
  
  UART="uart 3000"

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
