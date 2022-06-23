#!/bin/bash

if [ -f sw_version ]; then
	echo Artifacts from this pipeline are used.
	exit 0
fi

curl -fsSL --output artifacts.zip --header "JOB-TOKEN: $CI_JOB_TOKEN" \
	"$CI_API_V4_URL/projects/$CI_PROJECT_ID/jobs/artifacts/$CI_COMMIT_REF_NAME/download?job=reuse_sw"

if [ $? -ne 0 ]; then
	echo Artifact for job reuse_sw not found. Please update software source code to rerun compilation.
	exit 1
fi

unzip -o artifacts.zip

if [ ! -f sw_version ]; then
	echo File sw_version does not exist. Please update software source code to rerun compilation.
	exit 1
fi

SW_VERSION=`cat sw_version`

echo Reused software version: $SW_VERSION

git fetch origin $SW_VERSION
if ! git diff --exit-code $SW_VERSION software/workload/ucas-cod/benchmark lab_env.yml ; then
	echo Software build dependencies changed. Please update software source code to rerun compilation.
	exit 1
fi
