#!/bin/sh
#
mic_mute_file='/var/tmp/mic_mute'
notify_time=750


if [ ! -f $mic_mute_file ]; then 

    echo 0 > $mic_mute_file

fi


# mute all input source
# since i only ever expect my main mic to be active

for a in $(pactl list sources | grep 'Source #' | cut -d '#' -f2); do 

    pactl -- set-source-mute $a 0

done



if [[ $(cat /var/tmp/mic_mute) -eq 0 ]]; then                                                               
    # use `pactl list sources` to find the numbers 145 and 144
    # this is my headset
    pactl set-source-mute 145 1
    pactl set-source-mute 144 1

    echo 1 > /var/tmp/mic_mute

    notify-send -t $notify_time "Mic muted"

else

    pactl set-source-mute 145 0
    pactl set-source-mute 144 0

    echo 0 > /var/tmp/mic_mute

    notify-send -t $notify_time "Mic unmuted"
fi

