#!/bin/sh

sep="|"

dte() {
    dte="$( date '+%d-%b-%Y  %I:%M %P' )"
    echo $dte
}

bat() {
    #bat="$(exec ~/bin/battery)"

    bat=$(acpi -b | awk '{print $4}' | sed 's/,//')
    if [[ $(acpi -b | awk '{print $3}') = "Charging," ]]; then
        chr="🗲";
    fi

    echo B: $bat $chr
}

mem() {
    mem="$(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
    echo M: $mem
}

vol() {
    if [[ $(amixer get Master | grep off) ]]; then
        vol=MUTE
    else
        vol=$(amixer get Master | grep -o "\[[0-9]\+%\]" | sed 's/[^0-9]*//g')
    fi
    echo V: $vol
}

#can modify this for other players
spot() {
    player="spotify"

    if [[ ! $(ps -C spotify | grep spotify) ]]; then
       return 
    fi

    if [ "$(playerctl status)" = "Playing" ]; then
        symbol=  
    else
        symbol= 
    fi

    title="$(playerctl -p $player metadata title)"
    artist=$(playerctl -p $player metadata artist)

    if [ "$(expr length "$title")" > 30 ]; then
        title="${title,0,30}"
    fi
    if [ "$(expr length "$artist")" > 30 ]; then
        artist="${artist,0,30}"
    fi

    echo $symbol $title - $artist $sep
}

while true; do
    xsetroot -name "$(spot) $(mem) $sep $(bat) $sep $(vol) $sep $(dte)"
    sleep 2s
done &
