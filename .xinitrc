#!/bin/sh

xinitdir=/etc/X11/xinit

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d $xinitdir/xinitrc.d ] ; then
    for f in "$xinitdir/xinitrc.d"/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_PLATFORMTHEME=qt5ct
export QT_PLATFORM_PLUGIN=qt5ct

export XDG_CURRRENT_DESKTOP=i3
export XDG_SESSION_DESKTOP=i3
export XDG_SESSION_TYPE=x11

export GTK_USE_PORTAL=1

export BROWSER=firefox
export EDITOR=nvim
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

prime-offload

# xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto                             || true
xrandr --output HDMI-0 --left-of eDP-1-1  || true
xrandr --output HDMI-0 --primary          || true

exec i3

