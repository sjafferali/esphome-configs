#!/bin/bash

find . -maxdepth 2 -mindepth 1 -type d -name .esphome | while read line ; do
    echo "Removing $line"
    rm -fr $line
done


ESPHOME="/Users/sjafferali/.virtualenvs/esphome/bin/esphome"
PATH="/Users/sjafferali/.virtualenvs/esphome/bin:$PATH" $ESPHOME dashboard config/
