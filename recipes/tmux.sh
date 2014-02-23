apt-get -y build-dep tmux
cd /usr/local/src
wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.8/tmux-1.8.tar.gz
tar -xf tmux-1.8.tar.gz
cd tmux-1.8
./configure --prefix /usr/local
make
make install
