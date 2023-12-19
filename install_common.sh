#!/bin/sh


args=(
   
   # cli utility 
   tealdeer  # tldr client
   dust      # find where disk usage is
   duf       # monitor drive disk usage
   lsd       # better ls
   neovim    # cli text editor
   btop      # system monitor      
   fastfetch # better neofetch
   nmap      # network utility
   ripgrep   # better grep
   git-delta # diff tool
   lazygit   # git tui
   
   # gui stuff
   keepassxc # password manager
   flameshot # screenshot utility
   pcmanfm   # minimal fast file manager
   timeshift # file system snapshots
   
   # notification daemon & client
   libnotify
   dunst     
   
   # polkit daemon & client 
   polkit    
   lxsession
)

sudo pacman -S "${args[@]}"

