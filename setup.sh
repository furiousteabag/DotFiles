#!/bin/sh

cp -rs $PWD/.config/ ~/
cp -rs $PWD/.local/ ~/
cp -rs $PWD/.zprofile ~/
cp -rs $PWD/.xinitrc ~/
sudo cp -rs $PWD/etc /
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.local/share/zsh/plugins/zsh-syntax-highlighting/
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/zsh/plugins/zsh-autosuggestions/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
#echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
