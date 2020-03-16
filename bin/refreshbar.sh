#!/bin/sh

#refreshes dwm bar
#kills bar during sleep

pkill dwmstatus
pkill sleep

exec ~/bin/dwmstatus.sh &
