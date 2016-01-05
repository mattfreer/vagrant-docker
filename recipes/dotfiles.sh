mkdir -p ~/dotfiles
cd ~/dotfiles
git clone https://github.com/mattfreer/dotfiles.git .
stow vim
stow tmux
stow git

#Install vim plugins
cd ~/.vim
git submodule init && git submodule update

#Install tmux plugins
cd ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm
./tpm/scripts/install_plugins.sh
