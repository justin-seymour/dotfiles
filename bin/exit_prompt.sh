#!/bin/bash

choice=$(echo -e "No\nYes" | dmenu -fn "monospace:size=9" -i -p "Exit DWM?")

if [ ! "$choice" = "Yes" ]; then
    exit 0
fi

pkill dwmstatus
killall dwm

