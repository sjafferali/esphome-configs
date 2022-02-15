#!/bin/bash

show_usage () {
    echo "build.sh [config-path]"
    exit 1
}

ESPHOME="/Users/sjafferali/.virtualenvs/esphome/bin/esphome"
CONFIG=$1

if [[ -f $1 ]]; then
    DEVICE_NAME=$(awk -F"[[:space:]]*\"?" '/^  name: \"?[a-z]/ {print$3}' $CONFIG)
    FIRMWARE_PATH="./.esphome/build/$DEVICE_NAME/.pioenvs/$DEVICE_NAME/firmware.bin"
    RESULT_DIR="build/$DEVICE_NAME"
    END_FIRMWARE_PATH=$RESULT_DIR/firmware.bin
    ABS_PATH=$(pwd)/$END_FIRMWARE_PATH
else
    show_usage
fi

echo "Building $CONFIG ($DEVICE_NAME)"
sleep 5
$ESPHOME compile $CONFIG

mkdir -pv $RESULT_DIR
cp -av $FIRMWARE_PATH $END_FIRMWARE_PATH
echo "==== DONE ===="
echo "$ABS_PATH"
echo
