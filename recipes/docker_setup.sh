# stop docker
systemctl stop docker

#Inform client that the self signed ssl cert that the Docker registry uses is legitimate
CERT_FILE="/certs/devdockerCA.crt"

if [ -f $CERT_FILE ];
then
  mkdir /usr/local/share/ca-certificates/docker-dev-cert
  cp $CERT_FILE /usr/local/share/ca-certificates/docker-dev-cert
  update-ca-certificates
else
  echo "File $CERT_FILE does not exists"
fi

# start docker
systemctl start docker

# Pull docker images specified in fig file
cd /scripts/ && docker-compose pull
