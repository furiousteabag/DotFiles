#!/bin/sh

# cleanup
[ -e ~/.gnupg ] && rm -rf ~/.gnupg
find ~/ -maxdepth 1 -name .bash\* -exec rm {} \;
find ~/ -maxdepth 1 -name .xsession\* -exec rm {} \;
[ -e ~/.lesshst ] && rm ~/.lesshst
[ -e ~/.viminfo ] && rm ~/.viminfo
[ -e ~/.Xauthority ] && rm ~/.Xauthority
[ -e ~/.dmrc ] && rm ~/.dmrc

# python virtualenv with jupyter vim binding
pip install virtualenvwrapper
source ~/.local/bin/virtualenvwrapper.sh
mkvirtualenv base
pip install jupyter jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextensions_configurator enable --user
mkdir -p $(jupyter --data-dir)/nbextensions
(cd $(jupyter --data-dir)/nbextensions && git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding && chmod -R go-w vim_binding)

# generate ssh key
ssh-keygen

# generate gpg key and clone password store
mkdir -p "$XDG_DATA_HOME"/gnupg
gpg --full-generate-key
# gpg --keyserver hkps://keys.openpgp.org --send-keys <keyid>


