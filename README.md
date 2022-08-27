# Openshift training !

## Setup

### Download this repo
```
sudo apt install git
git clone https://github.com/totou/openshift-training.git
```

### Start the cluster
Warning: with the log debug level, you will see "errors" in logs, ignore them, press accept to all Windows prompt that appear and it should be fine

A few manual commands
```
#cd <crc folder>
#export PATH=$PATH:$PWD
# Replace the pull secret with yours
crc --log-level debug setup
crc --log-level debug delete
crc --log-level debug config set enable-cluster-monitoring true
crc --log-level debug config set kubeadmin-password admin
crc --log-level debug config set consent-telemetry no
crc --log-level debug start --pull-secret-file red-hat-crc-pull-secret.txt --cpus 6 --memory 28000 --disable-update-check -n 1.1.1.1
# Retrieve credentials
crc console --credentials
# Login
oc login -u kubeadmin -p admin https://api.crc.testing:6443
```
Cluster console: https://console-openshift-console.apps-crc.testing/

### Link WSL to CRC
Semi-automatic version (recommended WSL2)
```
./tools/setup_wsl2.sh <Windows Username>
```

Semi-automatic version (recommended WSL1)
```
# In powershell get the cluster ip
ping api.crc.testing
# Call script
./tools/setup_wsl1.sh <Windows Username> <Cluster IP>
```

Manual version (deprecated)
```
# Link WSL with Windows
mkdir ~/.kube
ln -s /mnt/c/Users/MSI1-S2/.kube/config ~/.kube/config
wget https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz && tar -xvf oc.tar.gz && chmod a+x oc kubectl && sudo cp oc kubectl /usr/local/bin/
# In powershell get the ip
ping api.crc.testing
# Add IP in /etc/hosts file
172.20.166.233 api.crc.testing *.apps-crc.testing
```

## Toolbox
```
# Create the toolbox (wait for the build to finish, might take a few minutes)
oc create -f my-toolbox
# Connect to the POD
oc -n mytoolbox exec -ti $(oc -n mytoolbox get pods | grep Running | cut -d ' ' -f 1) -- bash
```

