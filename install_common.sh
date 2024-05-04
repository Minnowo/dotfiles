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
    bat       # better cat
    npm     
    docker
    docker-compoase

    # gui stuff
    keepassxc  # password manager
    flameshot  # screenshot utility
    pcmanfm    # minimal fast file manager
    timeshift  # file system snapshots
    alacritty  # terminal
    polybar    # bar for i3
    obs-studio # screen capture
    xarchiver  # archive manager

    # see https://archsetup.blogspot.com/2023/11/install-windows-11-on-virt-manager.html
    # for a in-depth guide
    virt-manager
    qemu-full

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


# make pcmanfm open directories
xdg-mime default pcmanfm.desktop inode/directory

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


