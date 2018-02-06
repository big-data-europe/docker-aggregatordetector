#!/bin/bash

export APP=/allApps/RangeDopplerTerrainCorrection
export IMG_FILEPATH=$1
export DEM_FILEPATH=$2
export RESULT_IMG_FILEPATH=$3
export MINX=$4
export MINY=$5
export MAXX=$6
export MAXY=$7
export EPSG=4326
export PIXEL_SIZE=-1

printf "\n"
echo "Submiting ${APP} with arguments:"
echo "IMG_ABS_FILEPATH = ${IMG_FILEPATH}"
echo "DEM_ABS_FILEPATH = ${DEM_FILEPATH}"
echo "Processing in boundaries: minX, minY, maxX, maxY:\n ${MINX} ${MINY} ${MAXX} ${MAXY}"
echo "Result will be: ${RESULT_IMG_FILEPATH}"
echo "Computing Terrain Correction..."

time ${APP} ${IMG_FILEPATH} ${DEM_FILEPATH} ${EPSG} ${PIXEL_SIZE} \
 ${RESULT_IMG_FILEPATH} ${MINX} ${MINY} ${MAXX} ${MAXY}

echo "...TerrainCorrection for image ${IMG_FILEPATH} has been applied."