#!/bin/bash

if xrandr | grep "HDMI1 connected"; then
    xrandr --output eDP1 --primary --mode 1366x768 --pos 1920x312 --rotate normal --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
    #wal -R
else
    xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI1 --off --output VIRTUAL1 --off
    #wal -R
fi
