#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="~/.local/bin:$PATH"

alias ls='lsd'

alias cat='bat'
alias vim='nvim'

alias sudo="doas"
alias sudoedit='doasa rnano'

alias unmount-network='doas umount -t cifs,nfs -a -l'
alias mount-network='doas mount -t cifs,nfs -a'
alias find-local='nmap -n -sn 192.168.1.1/24'

alias gpu="nvidia-smi -l 1"

alias mpvc="mpv \"\$(ls | dmenu)\""
alias jviewc="jview \"\$(ls | dmenu)\""

export IM4JAVA_TOOLPATH="/bin/"

export GTK_USE_PORTAL=1

export VISUAL=nvim

alias update="doas pacman -Syu"

function install() { update && doas pacman -S "$1"; }
function remove_orphans() { doas pacman -Rsn $(pacman -Qdtq); }
function uninstall() { doas pacman -R "$1" && remove_orphans; }


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
export LS_COLORS="${LS_COLORS}*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:"
export LS_COLORS="${LS_COLORS}*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:"

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

lfcd () {
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


neofetch


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$PATH:/opt/miniconda3/bin"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"
