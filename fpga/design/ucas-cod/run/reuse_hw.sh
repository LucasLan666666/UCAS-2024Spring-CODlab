#!/bin/bash

if [ -f hw_version ]; then
	echo Artifacts from this pipeline are used.
	exit 0
fi

curl -fsSL --output artifacts.zip --header "JOB-TOKEN: $CI_JOB_TOKEN" \
	"$CI_API_V4_URL/projects/$CI_PROJECT_ID/jobs/artifacts/$CI_COMMIT_REF_NAME/download?job=reuse_hw"

if [ $? -ne 0 ]; then
	echo Artifact for job reuse_hw not found. Please update hardware source code to rerun bitstream generation.
	exit 1
fi

unzip -o artifacts.zip

if [ ! -f hw_version ]; then
	echo File hw_version does not exist. Please update hardware source code to rerun bitstream generation.
	exit 1
fi

HW_VERSION=`cat hw_version`

echo Reused hardware version: $HW_VERSION

git fetch origin $HW_VERSION
if ! git diff --exit-code $HW_VERSION fpga/design/ucas-cod/hardware lab_env.yml ; then
	echo Hardware build dependencies changed. Please update hardware source code to rerun bitstream generation.
	exit 1
fi
