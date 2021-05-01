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


