#!/bin/bash

sleep 0.1s

cl=$(xset -q | grep Caps | awk '{print $4}')
msgId="113"

if [ $cl = "on" ]; then
    dunstify -r $msgId -a "capslock" "Caps Lock On" -u critical
else
    dunstify -r $msgId -a "capslock" "Caps Lock Off" -t 1000
fi
