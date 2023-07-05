#!/bin/sh

file="/var/tmp/mic_mute"

if [ -f "$file" ]; then

    first_line=$(head -n 1 "$file" | tr -d '[:space:]' | cut -c1) 

    if [ "$first_line" -eq 0 ]; then

        echo "Unmuted"

    else 

        echo "Muted"

    fi

else

    echo "Mute file DNE"

fi 


