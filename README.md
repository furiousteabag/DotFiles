# Setup

Install latest version of programs from source:
```bash
TODO
```

Execute setup script:
```bash
git clone https://github.com/SmirnovAlexander/DotFiles.git
cd DotFiles
./setup.sh
```

Install vim plugins:
```
:PlugInstall
```

Install tmux plugins:
```
prefix + I
```

# TODO

- add virtualenv creation with vim jupyter extension
- add softlinks instead of copying files
    * may pull changes from remote
- add branches for home pc / server setups
- add script for packages installation from source / latest versions
    * install tmux from source
    * install ranger from source
    * install neovim from source
    * **[IMPORTANT]** tmux is not loading config from `$XDG_CONFIG_HOME/tmux/tmux.conf` on old versions

