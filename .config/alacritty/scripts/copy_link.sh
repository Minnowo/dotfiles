#!/bin/sh 

if [ $# -ne 0 ]; then 

    trimmed=$(echo "$1" | tr -d '[:space:]')

    echo "$trimmed" | xclip -selection clipboard

    if [ $? -eq 0 ]; then

        # trimmed=$(echo "$trimmed" | cut -c1-50)

        notify-send "Copied" "$trimmed"

    else

        notify-send "Failed to copy to clipboard"

    fi

else

    notify-send "Could not copy, no start arguments"

fi


