#!/bin/bash

if [[ "$1" == "start" ]]; then
	xautolock -time 14 \
		-locker "$HOME/.local/bin/screenlock lock" \
		-killtime 15 \
		-killer "xset dpms force off" \
		-corners 0-0+ \
		-cornerdelay 3 \
		-cornerredelay 60 \
		-detectsleep &
fi

if [[ "$1" == "toggle" ]]; then
	if [[ "$AUTOLOCK_SCREEN" == "on" ]]; then
		export AUTOLOCK_SCREEN=off
		xautolock -disable
		echo "Autolock is now off."
		notify-send "Autolock is OFF"
	else
		export AUTOLOCK_SCREEN=on
		xautolock -enable
		echo "Autolock is now on."
		notify-send "Autolock is ON"
	fi
fi

#if [[ "$AUTOLOCK_SCREEN" == "on" ]]; then
	#[[ "$(xkb-switch -p)" == "ru" ]] && xkb-switch -n
	#screenlock $1
	##i3lock -nf --color=000000
#fi

