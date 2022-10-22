#!/bin/bash

if [ $# -lt 1 ]
  then
    echo "Not enough arguments supplied. You must provide your Windows username"
    exit 0
fi

windows_login=${1}
#cluster_api_ip=${2}
TOOLS_DIR=$(dirname $0)

HELM_VERSION=3.9.2

# Install basic stuff
sudo apt update
sudo apt install vim wget curl tree -y
pushd /tmp
#wget https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz && tar -xvf oc.tar.gz && chmod a+x oc kubectl && sudo mv oc kubectl /usr/local/bin/ && rm oc.tar.gz
wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest/openshift-client-linux.tar.gz && tar -xvf openshift-client-linux.tar.gz && chmod a+x oc kubectl && sudo mv oc kubectl /usr/local/bin/ && rm openshift-client-linux.tar.gz
# Hack oc
sudo rm /usr/local/bin/oc
sudo ln -s /mnt/c/Users/${windows_login}/.crc/bin/oc/oc.exe /usr/local/bin/oc
wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz && tar -xvf helm-v${HELM_VERSION}-linux-amd64.tar.gz && chmod a+x linux-amd64/helm && sudo mv linux-amd64/helm /usr/local/bin/helm && rm helm-v${HELM_VERSION}-linux-amd64.tar.gz
popd

# Docker specific
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo groupadd -f docker
sudo usermod -aG docker $USER

# Basic vim setup
cp ${TOOLS_DIR}/vimrc ~/.vimrc

# Link oc to Windows CRC
#windows_login=`ls /mnt/c/Users/ | grep PCSPECIALIST`
mkdir -p ~/.kube/
rm -f ~/.kube/config
#ln -s /mnt/c/Users/${windows_login}/.kube/config ~/.kube/config

# Update /etc/hosts
#echo "${cluster_api_ip} api.crc.testing api.crc.testing oauth-openshift.apps-crc.testing apps-crc.testing *.apps-crc.testing" | sudo tee -a /etc/hosts

#export WSL_BRIDGE_IP=$(grep nameserver /etc/resolv.conf | sed 's/nameserver //')
#oc config set clusters.crc.server $WSL_BRIDGE_IP:8001
#oc config set contexts.crc.cluster crc
#oc config use-context crc
