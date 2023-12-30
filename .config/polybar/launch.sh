#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Put colors here,
# These should match the colors at the top of the config
export POLYBAR_COLOR_PRIMARY=#F0C674

# Launch the bar
polybar -c "$DIR"/config.ini &
