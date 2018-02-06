#!/bin/bash

export APP=/PyDBScan/DBScan/maindbscan/PointsProcessor.py
export IMG_FILEPATH=$1
export RESULT_IMG_FILEPATH=$2
export PIXEL_VAL_THRES=1.6
export EPS=0.00035
export MIN_PTS=4

printf "\n"
echo "Submiting ${APP} with arguments:"
echo "IMG_FILEPATH = ${IMG_FILEPATH}"
echo "RESULT_IMG_FILEPATH = ${RESULT_IMG_FILEPATH}"
echo "Applying the DBScan algorithm..."

python3 ${APP} ${IMG_FILEPATH} ${RESULT_IMG_FILEPATH} ${PIXEL_VAL_THRES} ${EPS} ${MIN_PTS}

echo "...changes detected. Result img is: ${RESULT_IMG_FILEPATH}"