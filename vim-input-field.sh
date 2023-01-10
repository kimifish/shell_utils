#!/usr/bin/env bash
_INPUT_FILE=$(mktemp)
xdotool key ctrl+a ctrl+c
# i3 will make this a scratch window based on the class.
# xterm 	-fa 'DejaVu Sans Mono for Powerline' \
#     	-fs 12 \
#     	-e vim \
#     		-c "startinsert" \
#     		-c "set noswapfile" \
#     		-c "setlocal wrap" \
#     		-c "normal \"+pG$" \
#     		$_INPUT_FILE
terminology --role="floating terminal" --exec "vim \
     		-c \"startinsert\" \
     		-c \"set noswapfile\" \
     		-c \"setlocal wrap\" \
     		-c \"normal \\\"+pG$\" \
     		$_INPUT_FILE"
wait
sleep 0.2
# strip last byte, the newline. https://stackoverflow.com/a/12579554
#head -c -1 $_INPUT_FILE | xdotool type --clearmodifiers --delay 0 --file -
#head -c -1 $_INPUT_FILE | xdotool type --delay 0 --file -
head -c -1 $_INPUT_FILE | xclip -selection clipboard
rm $_INPUT_FILE
xdotool key ctrl+v

