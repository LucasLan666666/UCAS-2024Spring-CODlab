#!/bin/bash

SIM_TARGET=$1
BENCH=$3
SIM_DUMP=$2

TOKEN_FILE=~/.gitlab.token
ARTI_FILE=artifacts.zip

NAMESPACE=ucas-cod-2022

# check if token file is ready
if [ ! -e $TOKEN_FILE ]
then
	echo "Error: Token file not found."
	exit
fi

TOKEN=`cat $TOKEN_FILE`

# Install curl jq
which curl;
if [ "$?" = 1 ]
then
	echo "Error: curl not found. Please install: sudo apt install -f curl"
	exit
fi

which jq;
if [ "$?" = 1 ]
then
	echo "Error: jq not found. Please install: sudo apt install -f jq"
	exit
fi

# Get username
USER=`curl -s --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.agileserve.org.cn:8001/api/v4/user" | jq .username | awk -F "\"" '{print $2}' `
echo $USER

# Get pipeline number
PIP_NUM=`curl -s --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.agileserve.org.cn:8001/api/v4/projects/$NAMESPACE%2F$USER/pipelines?ref=master" | jq .[0].id`
echo $PIP_NUM

if [ "$PIP_NUM" = "" ]
then
	echo "Error: Pipeline not found, please check CI/CD pipeline on GitLab."
	exit 1
fi

# Get job ID
echo $SIM_TARGET
case $SIM_TARGET in
	"example" | "alu" | "reg_file")
		JOB_NUM=`curl -s --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.agileserve.org.cn:8001/api/v4/projects/$NAMESPACE%2F$USER/pipelines/$PIP_NUM/jobs?per_page=80" | jq .[].name | grep -n -Fx \"bhv_sim\" | awk -F ":" '{print $1}'`
	;;
	"simple_cpu" | "custom_cpu")
		JOB_NUM=`curl -s --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.agileserve.org.cn:8001/api/v4/projects/$NAMESPACE%2F$USER/pipelines/$PIP_NUM/jobs?per_page=80" | jq .[].name | grep -n \ ${BENCH}]\" | awk -F ":" '{print $1}'`
	;;
	"custom_cpu_emu")
		JOB_NUM=`curl -s --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.agileserve.org.cn:8001/api/v4/projects/$NAMESPACE%2F$USER/pipelines/$PIP_NUM/jobs?per_page=80" | jq .[].name | grep -n -Fx \"wav_gen\" | awk -F ":" '{print $1}'`
	;;
	*)
		echo "Error: SIM_TARGET not found, please check parameter."
		exit 1
	;;
esac

if [ "$JOB_NUM" = "" ]
then
	echo "Error: Sim job not found, please check SIM_TARGET or BENCH parameters."
	exit 1
fi

JOB_ID=`curl -s --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.agileserve.org.cn:8001/api/v4/projects/$NAMESPACE%2F$USER/pipelines/$PIP_NUM/jobs?per_page=80" | jq .[$JOB_NUM-1].id`
echo $JOB_ID

# Download job artifacts
curl -s --output $ARTI_FILE --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.agileserve.org.cn:8001/api/v4/projects/$NAMESPACE%2F$USER/jobs/$JOB_ID/artifacts"

unzip -o $ARTI_FILE -d ../../../../
RET=$?

rm -rf $ARTI_FILE 
if [ "$RET" != 0 ]
then
	echo "Error: Artifacts is not ready, please check the status of bhv_sim job on GitLab"
	exit 1
fi

# Open waveform via gtkwave
gtkwave -f ../../../../$SIM_DUMP 
