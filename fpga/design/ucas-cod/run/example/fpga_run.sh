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

SW_ELF_BIN=./software/workload/ucas-cod/host/$1/elf/loader_$CNT

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
