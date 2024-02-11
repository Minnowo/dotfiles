#!/bin/sh


args=(

    # cli utility 
    tmux      # mutliplexer
    tealdeer  # tldr client
    dust      # find where disk usage is
    duf       # monitor drive disk usage
    lsd       # better ls
    neovim    # cli text editor
    btop      # system monitor      
    fastfetch # better neofetch
    nmap      # network utility
    ripgrep   # better grep
    fd        # regex search
    git-delta # diff tool
    lazygit   # git tui
    npm     

    # gui stuff
    keepassxc # password manager
    flameshot # screenshot utility
    pcmanfm   # minimal fast file manager
    timeshift # file system snapshots
    alacritty # terminal
    polybar   # bar for i3

    ttf-jetbrains-mono-nerd

    # notification daemon & client
    libnotify
    dunst     

    syncthing

    # polkit daemon & client 
    polkit    
    lxsession
)

sudo pacman -S "${args[@]}"


args=(
    brave-bin
    osu-lazer-bin
    vscodium-bin
    opentabletdriver
    miniconda3

    # https://github.com/Askannz/optimus-manager?tab=readme-ov-file#installation
    optimus-manager
)

yay -S "${args[@]}"


