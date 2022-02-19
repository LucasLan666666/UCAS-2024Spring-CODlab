#!/bin/env bash

BIT_FILE_BIN=role_$1.bit.bin
BIT_FILE=./hw_plat/ucas-cod_nf/$BIT_FILE_BIN

FIRMWARE_PATH=/lib/firmware

MANAGER_PATH=/sys/class/fpga_manager/fpga0

CONFIGFS_PATH=/sys/kernel/config/device-tree/overlays/role_$1

SW_ELF_BIN=./software/workload/ucas-cod/host/$2/elf/loader_$1

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
$SW_ELF_BIN
RET=$?

#=============================#
# Step 3: Environment cleanup #
#=============================#
#rmdir $CONFIGFS_PATH
#rm -f $FIRMWARE_PATH/$BIT_FILE_BIN
echo 0 > $CONFIGFS_PATH/status

#=======================
# Step 4: Check if all benchmarks passed
#=======================
if [[ $RET != 0 ]];
then
        echo "Error: Run fpga_eval failed."
        exit -1
fi
