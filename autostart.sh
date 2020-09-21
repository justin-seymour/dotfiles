#!/bin/bash

syndaemon -i 0.8 -K -d -R -t &

picom &

feh --no-fehbg --bg-scale ~/Pictures/uenhk4759a831.jpg &

nm-applet &

udiskie -t &

exec ~/bin/dwmstatus.sh &

~/documents/rcode/caps_indicator/caps
