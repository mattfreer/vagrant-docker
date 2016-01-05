# stop docker
systemctl stop docker

#Inform client that the self signed ssl cert that the Docker registry uses is legitimate
CERT_FILE="/certs/private-registry.dev/devdockerCA.crt"

if [ -f $CERT_FILE ];
then
  sh -c 'echo "192.168.10.10 private-registry.dev" > /etc/hosts'
  mkdir /usr/local/share/ca-certificates/docker-dev-cert
  cp $CERT_FILE /usr/local/share/ca-certificates/docker-dev-cert
  update-ca-certificates
else
  echo "File $CERT_FILE does not exists"
fi

# start docker
systemctl start docker
