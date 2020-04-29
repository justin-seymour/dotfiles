#!/bin/bash

syndaemon -i 0.8 -K -d -R -t &

picom &

feh --bg-scale ~/Pictures/uenhk4759a831.jpg &

nm-applet &

udiskie -t &

exec ~/bin/dwmstatus.sh &
