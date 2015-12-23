#Update your apt sources
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" > /etc/apt/sources.list.d/docker.list'
apt-get -y update
apt-get -y purge lxc-docker

apt-get -y update
apt-get install -y linux-image-extra-$(uname -r)

#Install Docker engine
apt-get -y install docker-engine

#Install Docker compose
sh -c 'curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose'
chmod +x /usr/local/bin/docker-compose

