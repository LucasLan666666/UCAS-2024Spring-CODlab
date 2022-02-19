#!/bin/bash
err_log=`cat $1 | grep "ERROR:"`; 
if [[ -n $err_log ]]; then echo "ERROR: Run vivado_prj failed."; exit 1; fi
