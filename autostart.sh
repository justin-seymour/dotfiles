#!/bin/bash

syndaemon -i 0.8 -K -d -R -t &

picom --config ~/.config/i3/compton.conf &

feh --bg-scale ~/Pictures/uenhk4759a831.jpg &

nm-applet &

udiskie -t &

exec ~/bin/dwmstatus.sh &
