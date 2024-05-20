#!/bin/sh

read width height <<< $(xdpyinfo | awk '/dimensions:/ {split($2, dims, "x"); print dims[1], dims[2]}')

# width_height=$(xdpyinfo | grep dimensions | awk '{print $2}')
# width=$(echo "$width_height" | awk -Fx '{print $1}')
# height=$(echo "$width_height" | awk -Fx '{print $2}')

# bmp is always fastest
# ideally qoi would be used but it is not supported by scrot
PICTURE=/tmp/doko_screen.bmp

scrot -z -o -q 100 -Z 1 "$PICTURE"

doko -x 0 -w "$width" -h "$height" -d -C -B -t "$PICTURE" "$PICTURE" 

rm "$PICTURE"

