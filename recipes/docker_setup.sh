# if $REGISTRY_IP env variable is not set then set a script var
if [ -z "$REGISTRY_IP" ]; then
  REGISTRY_IP='192.168.10.10:5000'
fi

# stop docker
sudo service docker stop

# In docker upstart conf file, change line that includes: 'exec "$DOCKER"'
# to pass `insecure-registry` option to docker binary
sudo sed -i "/exec \"\$DOCKER\"/c\exec \"\$DOCKER\" -d \$DOCKER_OPTS --insecure-registry $REGISTRY_IP" /etc/init/docker.conf

# start docker
sudo service docker start

# Pull docker images specified in fig file
cd /scripts/ && sudo docker-compose pull
