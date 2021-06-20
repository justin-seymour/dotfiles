#!/bin/bash

syndaemon -i 0.8 -K -d -R -t &

picom &

feh --no-fehbg --bg-scale ~/Pictures/background.jpg &

nm-applet &

udiskie -t &

#exec ~/bin/dwmstatus.sh &
~/code/dwmbar/dwmbar

#~/documents/rcode/caps_indicator/caps
~/doc/caps_indicator/caps
