#!/usr/bin/env bash
#
# Script to install my programs and configs
# to new arch/debian machine.
#
# To list options, type './setup.sh help'.


cmd_usage() {
    cat <<-_EOF
Usage:
    $PROGRAM arch [--desktop,-d]
        Installs packages for Arch Linux.
        If --desktop is specified, configures desktop setup as well.
    $PROGRAM debian [--no-root,-n]
        Installs packages for Debian/Ubuntu.
        If --no-root is specified, will use nix package manager instead.
    $PROGRAM help
        Show this text.
_EOF
}

die() {
    echo "$@" >&2
    exit 1
}

cmd_install_common() {
    cp -rs $PWD/.config/ ~/
    cp -rs $PWD/.local/ ~/
    cp -rs $PWD/.zprofile ~/

    git clone https://github.com/zsh-users/zsh-syntax-highlighting \
        "${XDG_DATA_HOME:-$HOME/.local/share}"/zsh/plugins/zsh-syntax-highlighting/
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${XDG_DATA_HOME:-$HOME/.local/share}"/zsh/plugins/zsh-autosuggestions/
    git clone https://github.com/joshskidmore/zsh-fzf-history-search \
        "${XDG_DATA_HOME:-$HOME/.local/share}"/zsh/plugins/zsh-fzf-history-search/
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/zsh/plugins/zsh-docker-completion/_docker \
        --create-dirs \
        https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker

    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
        --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    pip3 install neovim
    nvim +PlugInstall +qall
    nvim +'call coc#util#install()' +qall

    git clone https://github.com/alexanderjeurissen/ranger_devicons \
        "${XDG_CONFIG_HOME:-$HOME/.config}"/ranger/plugins/ranger_devicons
    # echo "default_linemode devicons" >> \
    #     "${XDG_CONFIG_HOME:-$HOME/.config}"/ranger/rc.conf

    # tmux plugin manager
    git clone https://github.com/tmux-plugins/tpm \
        "${XDG_DATA_HOME:-$HOME/.local/share}"/tmux/plugins/tpm
}

cmd_install_arch() {
    # Parse args
    local opts desktop=0
    opts="$(getopt -o d -l desktop -n "$PROGRAM" -- "$@")"
    local err=$?
    eval set -- "$opts"
    while true; do case $1 in
        -d|--desktop) desktop=1; shift ;;
        --) shift; break ;;
    esac done
    [[ ! -z "$1" || $err -ne 0 ]] && die "Usage: $PROGRAM $COMMAND [--desktop,-d]"

    # Install yay for AUR packages
    mkdir -p $HOME/Programs/yay-bin
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git $HOME/Programs/yay-bin
    (cd $HOME/Programs/yay-bin && makepkg -si)

    # Install common packages
    sudo pacman -S - < ./packages/packages_common.txt

    if [ "$desktop" == 1 ]; then
        # Install desktop-specific packages
        sudo pacman -S - < ./packages/packages_desktop.txt
        yay --answerdiff N --answerclean N -S - < ./packages/packages_aur.txt

        # Disable useless daemons on startup
        sudo systemctl disable lightdm.service
        sudo systemctl disable bluetooth.service
        sudo systemctl daemon-reload
        sudo systemctl enable --now disable-lid-on-open

        # Add user to input group to read touchpad device (libinput-gestures)
        sudo gpasswd -a $USER input

        # Copy X11 settings
        cp -rs $PWD/.xinitrc ~/
        sudo rm /etc/X11/xorg.conf.d/00-keyboard.conf
        sudo cp -rs $PWD/.config/etc /

        # Install and configure st terminal emulator
        # "https://st.suckless.org/patches/alpha/st-alpha-osc11-20220222-0.8.5.diff"
        # "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.5.diff"
        patches=(
            "https://st.suckless.org/patches/font2/st-font2-0.8.5.diff"
            "https://st.suckless.org/patches/copyurl/st-copyurl-multiline-20230406-211964d.diff"
            "https://st.suckless.org/patches/externalpipe/st-externalpipe-0.8.4.diff"
        )
        mkdir -p $HOME/Programs/st
        git clone https://git.suckless.org/st $HOME/Programs/st && cd $HOME/Programs/st
        for patch in "${patches[@]}"; do
            wget $patch -P $HOME/Programs/st/patches/
            patch < $HOME/Programs/st/patches/$(basename $patch)
        done
        sed -i 's/static char \*font =.*/static char \*font = "Source Code Pro:size=11";/' config.def.h
        sed -i '/static char \*font2\[\] = {/,/};/c\static char *font2[] = { "NotoColorEmoji:pixelsize=10:antialias=true:autohint=true" };' config.def.h
        sed -i 's/int allowwindowops = 0;/int allowwindowops = 1;/' config.def.h
        sed -i 's/"black", \/\* default background colour \*\//"#1e1e1e", \/\* default background colour \*\//' config.def.h
        sed -i -e 's/XK_l,/XK_u,/g' -e 's/XK_L,/XK_U,/g' config.def.h
        sudo make clean install
        cd
    fi

    chsh -s $(which zsh)

    cmd_install_common
}

cmd_install_debian() {
    # Parse args
    local opts root=1
    opts="$(getopt -o n -l no-root -n "$PROGRAM" -- "$@")"
    local err=$?
    eval set -- "$opts"
    while true; do case $1 in
        -n|--no-root) root=0; shift ;;
        --) shift; break ;;
    esac done
    [[ ! -z "$1" || $err -ne 0 ]] && die "Usage: $PROGRAM $COMMAND [--no-root,-n]"

    if [ "$root" == 1 ]; then
        sudo apt update

        # Adding sources for the latest Node version
        sudo apt install -y ca-certificates curl gnupg
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
        NODE_MAJOR=20
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
        sudo apt update

        sudo apt -y upgrade

        while read package; do
            sudo apt install -y $package
        done < ./packages/packages_common.txt

        # Make bat a valid executable so ranger
        # filemanager can use it for syntax highlight;
        # Same for fd for search
        command -v batcat >/dev/null && { mkdir -p ~/.local/bin; ln -s /usr/bin/batcat ~/.local/bin/bat; }
        command -v fdfind >/dev/null && { mkdir -p ~/.local/bin; ln -s /usr/bin/fdfind ~/.local/bin/fd; }

        # Installing last version of neovim
        sudo apt remove -y neovim
        mkdir -p $HOME/Programs
        (cd $HOME/Programs &&
             wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz &&
             tar -xzf nvim-linux-x86_64.tar.gz &&
             ln -s $PWD/nvim-linux-x86_64/bin/nvim /usr/bin/nvim)

        # Installing latest version of tmux
        sudo apt remove -y tmux
        sudo apt install -y libevent-dev ncurses-dev
        (cd $HOME/Programs &&
             wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz &&
             tar -zxf tmux-*.tar.gz
             cd tmux-*/
             ./configure
             make && sudo make install)

        sudo chsh -s $(which zsh) $USER
    else
        # Installing nix package manager
        mkdir -p $HOME/Programs/nix
        (cd $HOME/Programs/nix && sh <(curl -L https://nixos.org/nix/install) --no-daemon)
        . $HOME/.nix-profile/etc/profile.d/nix.sh
        echo '[[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh' \
            >> .zprofile

        while read package; do
            nix-env -i $package
        done < ./packages/packages_common.txt

        [[ -e $HOME/.profile ]] && mv $HOME/.profile $HOME/.profile_copy
        [[ -e $HOME/.bash_profile ]] && mv $HOME/.bash_profile $HOME/.bash_profile_copy
        echo 'export SHELL=`which zsh`; [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l' > $HOME/.profile
    fi

    cmd_install_common
}


PROGRAM="${0##*/}"
COMMAND="$1"

case "$1" in
    arch)             shift; cmd_install_arch "$@" ;;
    debian|ubuntu)    shift; cmd_install_debian "$@" ;;
    help|--help)      shift; cmd_usage "$@" ;;
    *)                       cmd_usage "$@" ;;
esac

exit 0
