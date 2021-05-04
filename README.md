# How to start the cluster

Openshift-training !

sudo apt install git
git clone https://github.com/totou/openshift-training.git

cd <crc folder>
export PATH=$PATH:$PWD
# Replace the pull secret with yours
crc --log-level debug setup
crc --log-level delete
crc --log-level debug start --pull-secret-file <pull secret file>
#crc --log-level debug start --pull-secret-file red-hat-crc-pull-secret.txt -m 14336 --disable-update-check -n 1.1.1.1
crc --log-level debug start --pull-secret-file red-hat-crc-pull-secret.txt -m 23000 --disable-update-check -n 1.1.1.1

crc console --credentials
https://console-openshift-console.apps-crc.testing/

# Link WSL with Windows
mkdir ~/.kube
ln -s /mnt/c/Users/MSI1-S2/.kube/config ~/.kube/config
wget https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz && tar -xvf oc.tar.gz && chmod a+x oc kubectl && sudo cp oc kubectl /usr/local/bin/
# In powershell get the ip
ping api.crc.testing
# Add IP in /etc/hosts file
172.20.166.233 api.crc.testing *.apps-crc.testing

