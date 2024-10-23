#!/bin/bash

TOOLS_DIR=`realpath $(dirname $0)`
echo "Tools directory is ${TOOLS_DIR}"

source ${TOOLS_DIR}/environment.sh

if [ -d "${HOME}/${OPENSHIFT_LOCAL_CRC_INSTALL_FOLDER}" ]
then
    echo "It seems that you have already done the setup as folder for the training already exists, looks good"
    echo "If you want to redo the setup from scratch remove the folder ${HOME}/${OPENSHIFT_LOCAL_CRC_INSTALL_FOLDER} and relaunch this script"
    exit 0
fi

# Download CRC
mkdir ${HOME}/${OPENSHIFT_LOCAL_CRC_INSTALL_FOLDER}
cd ${HOME}/${OPENSHIFT_LOCAL_CRC_INSTALL_FOLDER}/
wget https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/${CRC_VERSION}/crc-linux-amd64.tar.xz
tar xvf crc-linux-amd64.tar.xz
cd crc-linux-${CRC_VERSION}-amd64/

# Prereq CRC
sudo apt update
sudo apt-get install vim network-manager firefox wget curl tree ca-certificates virtiofsd -y

# Helm install
pushd /tmp
wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz && tar -xvf helm-v${HELM_VERSION}-linux-amd64.tar.gz && chmod a+x linux-amd64/helm && sudo mv linux-amd64/helm /usr/local/bin/helm && rm helm-v${HELM_VERSION}-linux-amd64.tar.gz
popd

# Ensure systemd runs next reboot of WSL2
# This is needed for the network setup of CRC that uses a service from there: network-manager
# Add https://askubuntu.com/questions/1379425/system-has-not-been-booted-with-systemd-as-init-system-pid-1-cant-operate
#[boot]
#systemd=true
sudo cp ${TOOLS_DIR}/static/wsl.conf /etc/wsl.conf

# Basic vim setup
cp ${TOOLS_DIR}/static/vimrc ~/.vimrc

# Ask user to restart the wsl
echo "First part of the setup is done, please restart the WSL2!"
echo "Open a powershell as admin and execute 'wsl.exe --shutdown'"
echo "Then re-open a terminal in WSL to start it again"

