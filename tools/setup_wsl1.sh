#!/bin/bash

if [ $# -lt 2 ]
  then
    echo "Not enough arguments supplied. You must provide your Windows username and the IP of the CRC cluster"
    exit 0
fi

windows_login=${1}
cluster_api_ip=${2}
TOOLS_DIR=$(dirname $0)

# Install basoc stuff
sudo apt update
sudo apt install docker.io vim wget curl
pushd /tmp
wget https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz && tar -xvf oc.tar.gz && chmod a+x oc kubectl && sudo mv oc kubectl /usr/local/bin/ && rm oc.tar.gz
wget https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz && tar -xvf helm-v3.6.3-linux-amd64.tar.gz && chmod a+x linux-amd64/helm && sudo mv linux-amd64/helm /usr/local/bin/helm && rm helm-v3.6.3-linux-amd64.tar.gz
popd

# Basic vim setup
cp ${TOOLS_DIR}/vimrc ~/.vimrc

# Link oc to Windows CRC
#windows_login=`ls /mnt/c/Users/ | grep MSI`
mkdir -p ~/.kube/
rm -f ~/.kube/config
ln -s /mnt/c/Users/${windows_login}/.kube/config ~/.kube/config

# Update /etc/hosts
echo "${cluster_api_ip} api.crc.testing api.crc.testing oauth-openshift.apps-crc.testing apps-crc.testing *.apps-crc.testing" | sudo tee -a /etc/hosts

