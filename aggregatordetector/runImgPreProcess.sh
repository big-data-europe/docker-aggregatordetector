#!/bin/bash

export APP=/allApps/preprocessing.jar
export INP_IMG_FILEPATH=$1
export RESULT_IMG_NAME=$2
export POLYGON=${@:3}

printf "\n"
echo "Submiting ${APP} with arguments:"
echo "args[0] = ${INP_IMG_FILEPATH}"
echo "args[1] = ${RESULT_IMG_NAME}"
echo "args[2] = ${POLYGON}"
echo "Computing subset..."

java -Xmx12g -jar ${APP} ${INP_IMG_FILEPATH} ${RESULT_IMG_NAME} ${POLYGON}
echo "...image ${IMG_NAME} has been subseted and calibrated."