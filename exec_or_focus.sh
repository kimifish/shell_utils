#!/bin/bash

export DISPLAY=:0
wmctrl -l | [[ $( grep -i $@ ) ]] && (wmctrl -a "$@"&) || "$@"&
