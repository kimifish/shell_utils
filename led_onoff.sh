#!/bin/bash

if [[ "$1" == "on" ]]; then
    xset led 3;
    export LED3_STATE=1
    exit 0
fi
if [[ "$1" == "off" ]]; then
    xset -led 3;
    export LED3_STATE=0
    exit 0
fi

echo usage: $(basename $0) "on|off"
exit 1

