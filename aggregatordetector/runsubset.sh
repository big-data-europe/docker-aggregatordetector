#!/bin/bash

export APP=/javasparkapps/subset.jar
export IMG_DIR=$1
export IMG_NAME=$2
export POLYGON=${@:3}

printf "\n"
echo "Submiting ${APP} with arguments:"
echo "args[0] = ${IMG_DIR}"
echo "args[1] = ${IMG_NAME}"
echo "args[2] = ${POLYGON}"
echo "Computing subset..."
printf "\n"

java -Xmx12g -jar ${APP} ${IMG_DIR} ${IMG_NAME} ${POLYGON}
