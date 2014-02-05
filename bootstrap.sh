sh -c "echo deb http://get.docker.io/ubuntu docker main\
> /etc/apt/sources.list.d/docker.list"
apt-get -q -y update
apt-get -q -y --force-yes install lxc-docker git

apt-get -y build-dep tmux
cd /usr/local/src
wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.8/tmux-1.8.tar.gz
tar -xf tmux-1.8.tar.gz
cd tmux-1.8
./configure --prefix /usr/local
make
make install


