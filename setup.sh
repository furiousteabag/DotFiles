#!/bin/bash

read -p "OS [arch / debian]: " OS
read -p "Setup [desktop (0) / server (1)]: " SERVER

# disable useless daemons
if [ "$OS" == "arch" ] && [ "$SERVER" == 0 ]; then
    sudo systemctl disable lightdm.service
    sudo systemctl disable bluetooth.service
fi

# alternative package manager
if [ "$OS" == "arch" ]; then
    mkdir -p $HOME/Programs/yay-bin
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git $HOME/Programs/yay-bin
    (cd $HOME/Programs/yay-bin && makepkg -si)
elif [ "$OS" == "debian" ]; then
    mkdir -p $HOME/Programs/nix
    (cd $HOME/Programs/nix && sh <(curl -L https://nixos.org/nix/install) --no-daemon)
    . $HOME/.nix-profile/etc/profile.d/nix.sh
    echo '[[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh' >> .zprofile
fi

# packages installation
if [ "$OS" == "arch" ]; then
    sudo pacman -S - < ./packages/packages_common.txt
    if [ "$SERVER" == 0 ]; then
        sudo pacman -S - < ./packages/packages_desktop.txt
        yay -S - < ./packages/packages_yay.txt
    fi
elif [ "$OS" == "debian" ]; then
    while read package; do
        nix-env -i $package
    done < ./packages/packages_common.txt
fi

# symlink dotfiles
cp -rs $PWD/.config/ ~/
cp -rs $PWD/.local/ ~/
cp -rs $PWD/.zprofile ~/
if [ "$SERVER" == 0 ]; then
    cp -rs $PWD/.xinitrc ~/
    sudo rm /etc/X11/xorg.conf.d/00-keyboard.conf
    sudo cp -rs $PWD/.config/etc /
fi

# zsh with plugins
if [ "$OS" == "arch" ]; then
    chsh -s $(which zsh)
elif [ "$OS" == "debian" ]; then
    [[ -e $HOME/.profile ]] && mv $HOME/.profile $HOME/.profile_copy
    [[ -e $HOME/.bash_profile ]] && mv $HOME/.bash_profile $HOME/.bash_profile_copy
    echo 'export SHELL=`which zsh`; [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l' > $HOME/.profile

fi
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.local/share/zsh/plugins/zsh-syntax-highlighting/
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/zsh/plugins/zsh-autosuggestions/

# vim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
pip3 install neovim

# ranger devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
#echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
[[ "$SERVER" == 1 ]] && echo "tmux attach" >> .zprofile

# install st and change fonts
if [ "$SERVER" == 0 ]; then
    mkdir -p $HOME/Programs/st
    git clone https://git.suckless.org/st $HOME/Programs/st
    (cd $HOME/Programs/st && sed -i 's/static char \*font.*/static char \*font = "Source Code Pro:size=18";/' config.def.h && sed -i 's/int allowwindowops = 0;/int allowwindowops = 1;/' config.def.h && sudo make clean install)
fi
