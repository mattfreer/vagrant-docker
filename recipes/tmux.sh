apt-get build-dep tmux -y
mkdir -p /usr/local/stow/tmux
cd /usr/local/stow/tmux
wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-2.0/tmux-2.0.tar.gz
tar -xzvf tmux-2.0.tar.gz
mv tmux-2.0 tmux
rm tmux-2.0.tar.gz
cd /usr/local/stow/tmux/tmux
./configure && make && sudo make install
stow -d /usr/local/stow tmux
