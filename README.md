# Setup

1) Execute setup script:
    ```bash
    sudo pacman -S git
    git clone https://github.com/SmirnovAlexander/DotFiles.git
    cd DotFiles
    ./setup.sh
    ```
2) Reboot
3) Execute post setup script:
    ```bash
    ./post_setup.sh
    ```
4) Install vim plugins:
    ```
    :PlugInstall
    ```
5) Install tmux plugins:
    ```
    <C-b> + I
    ```
6) Brave settings
    - disable password savings
    - [vimium extension](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)
    - [workspaces extension](https://chrome.google.com/webstore/detail/workspaces/hpljjefgmnkloakbfckghmlapghabgfa?hl=en)
    - [grammarly extension](https://chrome.google.com/webstore/detail/grammarly-grammar-checker/kbfnbcaeplbcioakkpcpgfkobkghlhen)

## TODO

- pull password storage
    * generate GPG keys and push to keychain
    * pull keys, reencrypt passwords and push to remote
    * clone passwords
- add st plugins patches
    * [scroll](https://st.suckless.org/patches/scrollback/)
    * [transparency](https://st.suckless.org/patches/alpha/)
- add flag for desktop / server setup
- add flag for debian and if so pull from latest repositories
    * install `tmux`, `ranger`, `neovim` from source
    * **[IMPORTANT]** tmux is not loading config from `$XDG_CONFIG_HOME/tmux/tmux.conf` on old versions
