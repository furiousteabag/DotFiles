#!/bin/sh

# disable useless daemons
sudo systemctl disable lightdm.service
sudo systemctl disable bluetooth.service

# yay
mkdir -p $HOME/Programs/yay-bin
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git $HOME/Programs/yay-bin
(cd $HOME/Programs/yay-bin && makepkg -si)

# all packages (comment out the ones you don't want)
sudo pacman -S - < ./packages/packages_common.txt
sudo pacman -S - < ./packages/packages_desktop.txt
yay -S - < ./packages/packages_yay.txt

# symlink dotfiles
cp -rs $PWD/.config/ ~/
cp -rs $PWD/.local/ ~/
cp -rs $PWD/.zprofile ~/
cp -rs $PWD/.xinitrc ~/
sudo rm /etc/X11/xorg.conf.d/00-keyboard.conf
sudo cp -rs $PWD/.config/etc /

# zsh with plugins
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.local/share/zsh/plugins/zsh-syntax-highlighting/
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/zsh/plugins/zsh-autosuggestions/

# vim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# ranger devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
#echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

# install st and change fonts
mkdir -p $HOME/Programs/st
git clone https://git.suckless.org/st $HOME/Programs/st
(cd $HOME/Programs/st && sed -i 's/static char \*font.*/static char \*font = "Source Code Pro:size=22";/' config.def.h && sudo make clean install)
