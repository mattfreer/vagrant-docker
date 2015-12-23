# if $REGISTRY_IP env variable is not set then set a script var
if [ -z "$REGISTRY_IP" ]; then
  REGISTRY_IP='192.168.10.10:5000'
fi

# stop docker
systemctl stop docker

# Pass `insecure-registry` option to docker binary
sh -c 'echo "DOCKER_OPTS=\"-r=true --insecure-registry 192.168.10.10:5000 \${DOCKER_OPTS}\"" > /etc/default/docker'

# start docker
systemctl start docker

# Pull docker images specified in fig file
cd /scripts/ && docker-compose pull
