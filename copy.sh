


rsync -aivr --delete --progress \
    --exclude "watch_later" \
    --exclude "*.log" \
    ~/.config/mpv ./.config/


rsync -aivr --delete --progress \
   ~/.config/alacritty ./.config/


rsync -aivr --delete --progress \
   ~/.config/htop ./.config/

rsync -aivr --delete --progress \
   ~/.config/lsd ./.config/

rsync -aivr --delete --progress \
   ~/.config/kritarc ./.config/

rsync -aivr --delete --progress \
   ~/.config/kritashortcutsrc ./.config/



yes | cp -rf ~/.bashrc ./.bashrc 
yes | cp -rf ~/.inputrc ./.inputrc 
yes | cp -rf ~/.vimrc ./.vimrc 
