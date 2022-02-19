#!/bin/env bash

BIT_FILE_BIN=role_$1.bit.bin
BIT_FILE=./hw_plat/ucas-cod_nf/$BIT_FILE_BIN

FIRMWARE_PATH=/lib/firmware

MANAGER_PATH=/sys/class/fpga_manager/fpga0

CONFIGFS_PATH=/sys/kernel/config/device-tree/overlays/role_$1

SW_ELF_BIN=./software/workload/ucas-cod/host/simple_cpu/elf/loader_$1

BENCH_PATH=./software/workload/ucas-cod/benchmark/simple_test
BENCH_SUITE=$2
ARCH=mips

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
if [ ! -d $BENCH_PATH/$BENCH_SUITE ]; then
  echo "Incorrect bench suite name, should be one of basic medium advanced microbench hello"
fi

N_PASSED=0
N_TESTED=0

for bench in `ls $BENCH_PATH/$BENCH_SUITE/$ARCH/elf`; do
  #Launching benchmark in the list
  echo "Launching ${bench} benchmark..."

  $SW_ELF_BIN $BENCH_PATH/$BENCH_SUITE/$ARCH/elf/$bench
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

