#!/bin/sh

img=/tmp/i3lock.png
wata=~/Pictures/tmp/961aa56e26c7c5117f6fab63f3a90602d593c0217e31f415292a9eac1ad60c0e.png

scrot -o $img

if [ -r $wata ]; then 
   # convert $img $wata -scale 10% -scale 1000% -gravity center -composite $img

   # pixelate and overlay a bunch of $wata over the image
   convert $img \
       $wata -gravity center -composite \
       $wata -gravity West -composite \
       $wata -gravity NorthWest -composite \
       $wata -gravity North -composite \
       $wata -gravity NorthEast -composite \
       $wata -gravity East -composite \
       $wata -gravity SouthWest -composite \
       $wata -gravity South -composite \
       $wata -gravity SouthEast -composite \
       -scale 10% -scale 1000% \
       $img
else 
   # scale pixelate screenshot
   convert $img -scale 10% -scale 1000% $img
fi 

i3lock -i $img
# jview $img
