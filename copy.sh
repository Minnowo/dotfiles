


rsync -aivr --delete --progress \
    --exclude "watch_later" \
    --exclude "*.log" \
    ~/.config/mpv ./.config/


rsync -aivr --delete --progress \
   ~/.config/alacritty ./.config/

rsync -aivr --delete --progress \
   ~/.config/fastfetch ./.config/

rsync -aivr --delete --progress \
   ~/.config/lazygit ./.config/

rsync -aivr --delete --progress \
   ~/.config/htop ./.config/

rsync -aivr --delete --progress \
   ~/.config/lsd ./.config/

rsync -aivr --delete --progress \
   ~/.config/kritarc ./.config/

rsync -aivr --delete --progress \
   ~/.config/kritashortcutsrc ./.config/

rsync -aivr --delete --progress \
   ~/.config/i3 ./.config/

rsync -aivr --delete --progress \
   --exclude "forest" \
   ~/.config/polybar ./.config/

rsync -aivr --delete --progress \
   ~/.config/neofetch ./.config/

rsync -aivr --delete --progress \
   ~/.config/lf ./.config/

rsync -aivr --delete --progress \
   ~/.config/nvim ./.config/

rsync -aivr --delete --progress \
   --exclude "command-history" \
   --exclude "search-history" \
   --exclude "cache" \
   --exclude "lib.pl" \
   --exclude "playlists" \
   ~/.config/cmus ./.config/

yes | cp -rf ~/.bashrc ./.bashrc || true
yes | cp -rf ~/.inputrc ./.inputrc || true
yes | cp -rf ~/.vimrc ./.vimrc  || true
yes | cp -rf ~/.xprofile ./.xprofile  || true
yes | cp -rf ~/.xinitrc ./.xinitrc  || true

