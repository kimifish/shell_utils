#!/bin/bash

if [ $# -lt 2 ]; then
    echo usage: $(basename $0) "duration flash_period"
    exit 1
fi

duration=$1
period=$2

while true; do
    xset led 3
    sleep "$period"
    xset -led 3
    sleep "$period"
    ((start++))
    if [[ "$LED_FLASH" == 0 ]]; then
	break
    fi
done &
( sleep "$duration"; xset -led 3; killall ledflash.sh &2> /dev/null) &

