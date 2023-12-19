#!/bin/sh

# when installing drivers read
#
# https://wiki.archlinux.org/title/xorg#Driver_installation
# https://wiki.archlinux.org/title/Intel_graphics
#
#
# https://wiki.archlinux.org/title/GPGPU
# https://wiki.archlinux.org/title/NVIDIA
# https://wiki.archlinux.org/title/Hardware_video_acceleration




# for intel 3d accel
sudo pacman -S mesa lib32-mesa

# we are coffeelake (gen 8), so this should work
sudo pacman -S vulkan-intel lib32-vulkan-intel

# my cpu is legacy enough that we want this 
sudo pacman -S xf86-video-intel
#  >>> This driver now uses DRI3 as the default Direct Rendering
#      Infrastructure. You can try falling back to DRI2 if you run
#      into trouble. To do so, save a file with the following
#      content as /etc/X11/xorg.conf.d/20-intel.conf :
#        Section "Device"
#          Identifier  "Intel Graphics"
#          Driver      "intel"
#          Option      "DRI" "2"             # DRI3 is now default
#          #Option      "AccelMethod"  "sna" # default
#          #Option      "AccelMethod"  "uxa" # fallback
#        EndSection

# Hardware accelerated H.264 decoding
sudo pacman -S libva-intel-driver libva-utils


# to check for opencl
sudo pacman -S clinfo

# install opencl, again, we are coffeelake (gen 8), so we want this
sudo pacman -S intel-compute-runtime

# install nvidia drivers, and opencl for nvidia
sudo pacman -S nvidia nvidia-utils nvidia-settings lib32-nvidia-utils \
    opencl-nvidia lib32-opencl-nvidia # don't forget optional deps
 

# now intsall nvidia optimus manager 

