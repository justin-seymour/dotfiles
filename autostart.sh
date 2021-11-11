#!/bin/bash

# For dunst
# may be unnecessary for other installs
export $(dbus-launch)

syndaemon -i 0.8 -K -d -R -t &

picom &

#feh --no-fehbg --bg-scale ~/Pictures/background.jpg &
xwallpaper --zoom ~/pictures/wallpaper.jpg

nm-applet &

udiskie -t &

#exec ~/bin/dwmstatus.sh &
~/documents/dwmbar/dwmbar

#~/documents/rcode/caps_indicator/caps
~/documents/caps_indicator/caps
