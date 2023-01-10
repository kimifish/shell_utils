#!/bin/bash
exit 0
file="$HOME/kimiside@gmail.com/bin/screenlock.sh"
state="undetermined"
action=${1^^}

check() {
     if [[ $(head -n 91 "$file" | tail -n 1) == "exit 0" ]];then 
	 state="OFF" 
     elif [[ $(head -n 91 "$file" | tail -n 1) == "pass" ]]; then
	 state="ON"
     else	
	 state="ERROR"
     fi
}
check

if [[ "$action" == "$state" ]]; then
	echo "Blueproximity is already $state."
	exit 1
fi

if [[ "$action" == "SWITCH" ]]; then
	[[ "$state" == "ON" ]] && action="OFF" || action="ON"
fi

if [[ "$action" == "OFF" ]]; then
	awk -i inplace 'NR==91{print "exit 0"}7' "$file"
fi
if [[ "$action" == "ON" ]]; then
	awk -i inplace 'NR==91{print "pass"}' "$file"
fi
check
echo "Blueproximity is now $state."

