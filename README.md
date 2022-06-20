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

Restart shell

Install vim plugins:
```
:PlugInstall
```

Install tmux plugins:
```
prefix + I
```

Install and configure venvs:
```
python -m pip install virtualenvwrapper
source virtualenvwrapper.sh
mkvirtualenv base
```

# Files that are stored locally

- `~/.ssh/`
- `~/.local/share/gnupg/`

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

