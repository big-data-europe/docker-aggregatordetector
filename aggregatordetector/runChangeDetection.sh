#!/bin/bash

export APP=/allApps/LogRatioChangeDetection
export IMG1_FILEPATH=$1
export IMG2_FILEPATH=$2
export RESULT_IMG_FILEPATH=$3
export POLAR=VV

printf "\n"
echo "Submiting ${APP} with arguments:"
echo "IMG1_FILEPATH = ${IMG1_FILEPATH}"
echo "IMG2_FILEPATH = ${IMG2_FILEPATH}"
echo "Detecting changes..."

time ${APP} ${IMG1_FILEPATH} ${IMG2_FILEPATH} ${POLAR} ${RESULT_IMG_FILEPATH}

echo "...changes detected. Result img is: ${RESULT_IMG_FILEPATH}"