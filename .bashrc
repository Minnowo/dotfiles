#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export GTK_USE_PORTAL=1
export VISUAL=nvim
export IM4JAVA_TOOLPATH="/bin/"

if [ -d "/mnt/SSData/AndroidSDK" ]; then 
    export ANDROID_SDK_HOME=/mnt/SSData/AndroidSDK
    export PATH="$PATH:/mnt/SSData/AndroidSDK/flutter/flutter/bin"
fi

# HELPER FUNCTIONS
function _cmd_exist() { type "$1" > /dev/null 2>&1; }

alias ls='ls --color=always --group-directories-first'

# ALIAS & COMMANDS
if _cmd_exist 'lsd'; then
    alias ls='lsd'
fi

if _cmd_exist 'bat'; then
    alias cat='bat'
fi

if _cmd_exist 'nvim'; then
    alias vim='nvim'
    alias vi='nvim'
fi

if _cmd_exist 'doas'; then
    alias sudo='doas'
    alias sudoedit='doasa rnano'
fi

if _cmd_exist 'fastfetch'; then
    alias neofetch='fastfetch'
fi

if _cmd_exist 'codium'; then
    alias code='codium'
    alias code.='codium .'
    alias codium.='codium .'

fi

if _cmd_exist 'eclipse'; then
    alias eclipse='__NV_PRIME_RENDER_OFFLOAD=1 eclipse'
fi


# https://archlinux.org/news/deprecation-of-net-tools/
alias ifconfig="ip addr"
alias ipconfig="ip addr"

alias c="cd"
alias cd.="cd ."
alias cd..="cd .."

alias lgit="lazygit"

alias unmount-network='sudo umount -t cifs,nfs -a -l'
alias mount-network='sudo mount -t cifs,nfs -a'

alias find-local='nmap -n -sn 192.168.1.1/24'

# https://github.com/alacritty/alacritty/issues/3962#issuecomment-862212371
# helps ssh for older machines if you cannot install term info
alias ssh-xterm='TERM=xterm-256color ssh'

alias gpu="nvidia-smi -l 1"

alias tablet="systemctl --user restart opentabletdriver.service"

alias update="sudo pacman -Syu"

function install()        { update && sudo pacman -S "$1";         }
function remove_orphans() { sudo pacman -Rsn $(pacman -Qdtq);      }
function uninstall()      { sudo pacman -R "$1" && remove_orphans; }

function set-open-folder() { 
    # this took me so long to figure out
    xdg-mime default pcmanfm.desktop inode/directory
}

function update-mirrors(){ 
    sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
    sudo reflector --verbose \
        --latest 10 \
        --protocol https \
        --sort rate \
        --save /etc/pacman.d/mirrorlist
}

function tldr-curl() {
    for value in "$@"; do
        curl "cheat.sh/$value"; 
    done
}

function ffmpeg-hash() 
{ 
    for value in "$@"; do 

        if [ -f "$value" ]; then

            ffmpeg -loglevel error -i "$value" -map 0 -f hash -;

        fi

    done
}

function lfcd () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# requires https://github.com/Minnowo/tuip
function cdt() {

    # makes */ not appear in the arrays
    shopt -s nullglob

    files=()
    files+=(..)  # always include parent dir first
    files+=(.*/) # hidden dirs
    files+=(*/)  # other dirs

    shopt -u nullglob

    # run the tui to pick one
    if tuip "${files[@]}"; then

        # get it's output choice
        path=$(cat /tmp/tuip)

        rm -f /tmp/tuip

        if [ -d "$path" ]; then 

            cd "$path"
        else

            echo "Path $path does not exist!"
        fi

    fi
}



function close-luks(){
    NAME=$1
    NAME_PATH=$2

    if [ $# -ne 2 ]; then
        echo "Must supply <name> <path> to unmount and close"
        return 0
    fi

    sudo umount $NAME_PATH

    sudo cryptsetup close $NAME

    sudo rmdir $NAME_PATH
}

function open-luks() { 
    FILE=$1
    NAME=$2
    MOUNT_ON=$3

    if [ $# -lt 3 ]; then
        echo "You must give arguments <file-path> <mount-name> <mount-folder>"
        return 0
    fi

    if [ ! -f $FILE ]; then
        echo "File: [$FILE] does not exist."
        return 0
    fi

    if [[ ! "$NAME" =~ ^[a-zA-Z0-9_]+$ ]]; then
        echo "Name [$NAME] contains characters other than a-z A-Z 0-9 or _"
        return 0
    fi

    echo "Attempting to mount $FILE as $NAME"

    sudo cryptsetup open --type luks $FILE $NAME

    if [ $? -ne 0 ]; then
        echo "Error while mounting volumn"
        return 0
    fi

    sudo mkdir -p $MOUNT_ON

    sudo mount /dev/mapper/$NAME $MOUNT_ON
}


function find-truenas() {

    ips=$(nmap -n -sn 192.168.1.1/24 | grep -E -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}")

    echo "$ips" | while IFS= read -r ip; do

        echo "Searching: $ip"

        if curl -s -k -L "$ip" | grep -o -F "main-page-title" >/dev/null; then

            echo "TrueNAS: $ip"

            echo "Updating hosts file..."

            to_add="$ip truenas.local"

            sudo sed -i -E "s/\b([0-9]{1,3}\.){3}[0-9]{1,3}[ ]*truenas\.local\b/$to_add/" /etc/hosts || true

            if ! grep "truenas\.local" /etc/hosts; then

                echo "$to_add" | sudo tee -a /etc/hosts

                echo "Appending to hosts file..."

             fi

            echo "Done!"

            return 0

        fi

    done

    return 1
}

# PATH FOR COLORS
export LS_COLORS="rs=0:"
export LS_COLORS="${LS_COLORS}di=01;34:"
export LS_COLORS="${LS_COLORS}ln=01;36:"
export LS_COLORS="${LS_COLORS}mh=00:"
export LS_COLORS="${LS_COLORS}pi=40;33:"
export LS_COLORS="${LS_COLORS}so=01;35:"
export LS_COLORS="${LS_COLORS}do=01;35:"
export LS_COLORS="${LS_COLORS}bd=40;33;01:"
export LS_COLORS="${LS_COLORS}cd=40;33;01:"
export LS_COLORS="${LS_COLORS}or=40;31;01:"
export LS_COLORS="${LS_COLORS}mi=00:"
export LS_COLORS="${LS_COLORS}su=30;43:" # default is -> su=37;41:
export LS_COLORS="${LS_COLORS}sg=30;43:" # default is -> sg=30;43:
export LS_COLORS="${LS_COLORS}ca=00:"
export LS_COLORS="${LS_COLORS}tw=01;34:" # default is -> tw=30;42
export LS_COLORS="${LS_COLORS}ow=01;34:" # default is -> ow=34;42:
export LS_COLORS="${LS_COLORS}st=01;34:" # default is -> st=37;44:
export LS_COLORS="${LS_COLORS}ex=01;32:"
export LS_COLORS="${LS_COLORS}*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:"
export LS_COLORS="${LS_COLORS}*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.qoi=01;35:*.jxl=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:"
export LS_COLORS="${LS_COLORS}*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:"



# https://wiki.archlinux.org/title/Readline
#

# pretty stuff 
bind 'set show-all-if-ambiguous on'
bind 'set colored-stats on' 2>/dev/null

# hides ^c when pressing it in terminal
bind 'set echo-control-characters off '

# auto complete settings
bind 'set colored-completion-prefix on'
bind 'set completion-ignore-case on'

# input / keybindings 

# \e means alt
# \C- means ctrl

# makes ctrl+backspace and ctrl+delete delete stuff
# https://unix.stackexchange.com/a/264871
bind '"\C-h": backward-kill-word'

# alt+s appends "sudo " to the front of line
bind '"\es": "\C-asudo \C-e"'

# lets up/down arrow search based on typed context
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'




[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

[ -f "/home/minno/.ghcup/env" ] && . "/home/minno/.ghcup/env" # ghcup-env

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#     exec tmux
# fi


eval "$(zoxide init --cmd cd bash)"



