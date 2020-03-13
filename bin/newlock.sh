#!/bin/bash

TMPBG=/tmp/screen.png
scrot $TMPBG 
convert $TMPBG -scale 10% $TMPBG
convert $TMPBG -scale 1000% $TMPBG

if xrandr | grep "HDMI1 connected"; then
    convert $TMPBG -fill "rgba(0,0,0,0.8)" -draw "rectangle 1950,600 2260, 700" $TMPBG
else
    convert $TMPBG -fill "rgba(0,0,0,0.8)" -draw "rectangle 30,600 340, 700" $TMPBG
fi

i3lock -i $TMPBG --screen 1 --clock --indicator --timestr="%I:%M %p" --timepos="x+140:h-115" --datepos="tx+22:ty+25"  --datestr "Type password to unlock..." --insidecolor=00000000 --ringcolor=ffffffff --line-uses-inside --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 --insidevercolor=ffffffff --insidewrongcolor=d2ff0000 --ringvercolor=ffffffff --ringwrongcolor=ffffffff --indpos="x+290:h-118" --radius=20 --ring-width=3 --veriftext="" --wrongtext="" --timecolor="ffffffff" --datecolor="ffffffff" --noinputtext=""

rm $TMPBG
