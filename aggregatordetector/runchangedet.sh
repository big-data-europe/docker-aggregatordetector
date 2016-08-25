#!/bin/bash

export SPARK_MASTER_URL=spark://spark-master-sc7:7077
export SPARK_APPLICATION_JAR_LOCATION=/spark-app/changedetector-0.0.1-SNAPSHOT-allinone.jar
export SPARK_APPLICATION_MAIN_CLASS=eu.bde.sc7pilot.tilebased.TileBasedFinal
export SPARK_APP_ARG_HDFS=hdfs://namenode:8020
export SPARK_APP_ARG_LOCAL=/result
export SPARK_APPLICATION_IMG1=$1
export SPARK_APPLICATION_IMG2=$2

echo "Submit application ${SPARK_APPLICATION_JAR_LOCATION} with main class ${SPARK_APPLICATION_MAIN_CLASS} to Spark master ${SPARK_MASTER_URL}"
echo "Passing arguments ${SPARK_APPLICATION_IMG1} ${SPARK_APPLICATION_IMG2}"

/spark/bin/spark-submit \
    --master ${SPARK_MASTER_URL} \
    --executor-memory 10g \
    --driver-memory 10g \
    --class ${SPARK_APPLICATION_MAIN_CLASS} \
    ${SPARK_APPLICATION_JAR_LOCATION} ${SPARK_APP_ARG_HDFS} ${SPARK_APPLICATION_IMG1} ${SPARK_APPLICATION_IMG2} ${SPARK_APP_ARG_LOCAL}
