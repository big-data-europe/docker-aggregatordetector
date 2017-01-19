#!/bin/bash

export SPARK_MASTER_URL=spark://spark-master-sc7:7077
export SPARK_APP=/javasparkapps/sparkdbscan.jar
export SPARK_APP_MAIN_CLASS=serialProcessingNew.ChangePointsClusteringParallel
export ARG_LOCAL_FILEPATH=$1
export ARG_INPUT=$2
export ARG_OUTPUT=$3

printf "\n"
echo "Submit SPARK-APP: ${SPARK_APP}"
echo "Main-Class: ${SPARK_APP_MAIN_CLASS}"
echo "Spark-Master: ${SPARK_MASTER_URL}"
echo "Passing arguments: "
echo "args[0] = ${ARG_LOCAL_FILEPATH}"
echo "args[1] = ${ARG_INPUT}"
echo "args[2] = ${ARG_OUTPUT}"
echo "Running DBScan..."
printf "\n"

/spark/bin/spark-submit \
    --master ${SPARK_MASTER_URL} \
    --executor-memory 12g \
    --driver-memory 12g \
    --class ${SPARK_APP_MAIN_CLASS} \
    ${SPARK_APP} ${ARG_LOCAL_FILEPATH} ${ARG_INPUT} ${ARG_OUTPUT} 2> /dbscanlogs/errorOutput.log > /dbscanlogs/output.log


