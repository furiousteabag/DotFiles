# Setup

1) Execute setup script:
    ```bash
    sudo pacman -S git
    git clone https://github.com/SmirnovAlexander/DotFiles.git
    cd DotFiles
    ./setup.sh
    ```
2) Restart `Xorg`, `i3` and `shell`
3) Install vim plugins:
    ```
    :PlugInstall
    ```
4) Install tmux plugins:
    ```
    <C-b> + I
    ```

## TODO

- pull password storage
    * generate GPG keys and push to keychain
    * pull keys, reencrypt passwords and push to remote
    * clone passwords
- disable lightdm
- add st plugins patches
- add jupyter extension to base virtualenv
- add flag for desktop / server setup
- add flag for debian and if so pull from latest repositories
    * install `tmux`, `ranger`, `neovim` from source
    * **[IMPORTANT]** tmux is not loading config from `$XDG_CONFIG_HOME/tmux/tmux.conf` on old versions
