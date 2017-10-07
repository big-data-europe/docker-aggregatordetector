#!/bin/bash

export SPARK_MASTER_URL=spark://spark-master-sc7:7077
export SPARK_APP=/javasparkapps/sparkchangedet.jar
export SPARK_APP_MAIN_CLASS=eu.bde.sc7pilot.tilebased.TileBasedFinal
export ARG_HDFS=hdfs://namenode-sc7:8020
export ARG_LOCAL=/snap/
export ARG_MASTERDIM=$1
export ARG_MASTERTIFF=$2
export ARG_SLAVEDIM=$3
export ARG_SLAVETIFF=$4

printf "\n"
echo "Submit SPARK-APP: ${SPARK_APP}"
echo "Main-Class: ${SPARK_APP_MAIN_CLASS}"
echo "Spark-Master: ${SPARK_MASTER_URL}"
echo "Passing arguments: "
echo "args[0] = ${ARG_MASTERDIM}"
echo "args[1] = ${ARG_MASTERTIFF}"
echo "args[2] = ${ARG_SLAVEDIM}"
echo "args[3] = ${ARG_SLAVETIFF}"
echo "Detecting changes..."

/spark/bin/spark-submit \
    --master ${SPARK_MASTER_URL} \
    --executor-memory 14g \
    --driver-memory 14g \
    --class ${SPARK_APP_MAIN_CLASS} \
    ${SPARK_APP} ${ARG_HDFS} ${ARG_MASTERDIM} ${ARG_MASTERTIFF} ${ARG_SLAVEDIM} ${ARG_SLAVETIFF} ${ARG_LOCAL} 24 2> /cdlogs/errorOutput.log > /cdlogs/output.log
    
echo "...changes are detected."