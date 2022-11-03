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
sudo systemctl --user enable --now ~/.config/systemd/user/ssh-agent.service
ssh-add -K ~/.ssh/id_rsa
# add this new key to github

# generate gpg key and clone password store
mkdir -p "$XDG_DATA_HOME"/gnupg
gpg --full-generate-key
# gpg --export your_address@example.net | curl -T - https://keys.openpgp.org
# on host machine: 
#   gpg --auto-key-locate hkps://keys.openpgp.org --locate-keys user@example.net
#   gpg --refresh-keys --keyserver hkps://keys.openpgp.org
#   gpg --edit-key key-id trust
#   pass init key1 key2 key3
#   pass git push
# (cd ~/.local/share && git clone repo)
