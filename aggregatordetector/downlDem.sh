#!/bin/bash

export DEM_FILE_NAME=$1
export MINX=$2
export MINY=$3
export MAXX=$4
export MAXY=$5
export OUT_DIR=$6

printf "\n"
echo "Downloading dem file: ${DEM_FILE_NAME}"
echo "for region minX, minY, maxX, maxY:"
echo "${MINX} ${MINY} ${MAXX} ${MAXY}"

time eio clip -o ${DEM_FILE_NAME} --bounds ${MINX} ${MINY} ${MAXX} ${MAXY}

echo "...dem downloaded. Going to move it in directory: ${OUT_DIR}"
mv ${DEM_FILE_NAME} ${OUT_DIR}