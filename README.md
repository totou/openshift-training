# Openshift training !


https://docs.openshift.com/container-platform/4.17/openshift_images/managing_images/using-image-pull-secrets.html#images-allow-pods-to-reference-images-across-projects_using-image-pull-secrets
https://docs.openshift.com/container-platform/4.17/installing/installing_gcp/installing-restricted-networks-gcp.html#installation-initializing_installing-restricted-networks-gcp

Logging a changer

OperatorSDK?

Retirer anciens exos

## Setup

### Download this repo
```
sudo apt install git
git clone https://github.com/totou/openshift-training.git
```

### Install the cluster (should be already done)
```
cd openshift-training/tools/
# Source useful env vars
source environment.sh
# Install pre-requisites and download Openshift Local (CRC)
./setup_wsl2.sh
# In Powershell (stop WSL2 in order to restart it)
wsl.exe --shutdown
# Open a new Openshift terminal to start the WSL2 and go back to the tools folder
cd openshift-training/tools/
source environment.sh
./install_crc.sh
# Script will not work first try as it creates a new user/group and we need to relog...
# If script does not work second try, run it a few times more
# In Powershell (stop WSL2 in order to restart it)
wsl.exe --shutdown
# Open a new Openshift terminal to start the WSL2 and go back to the tools folder
cd openshift-training/tools/
source environment.sh
./install_crc.sh
```

### Start the cluster and setup environment
Warning: with the log debug level, you will see "errors" in logs, ignore them, press accept to all Windows prompt that appear and it should be fine

You should source `environment.sh` and `setup_environment_after_start.sh` in each of your terminals!

```
# Ensure that you have your pull-secret file and add it in the WSL2 at the place of your choice
cd openshift-training/tools/
source environment.sh
./start_crc.sh <path to your pull-secret>
source setup_environment_after_start.sh
```

Cluster console: https://console-openshift-console.apps-crc.testing/
Open firefox in a background task or in another terminal and go to the above URL
```
firefox&
```

#### Prefill the local registry

This is to avoid as much as possible to have docker.io rate limit when pulling images...
https://docs.docker.com/docker-hub/download-rate-limit/
100 pulls per 6 hours per IP address only!
```
# If you have a docker.io account, please use it
podman-remote login --username <username>
# I created a fake account to try to unblock situation: "traintrain"
cd openshift-training/tools/
./prefill_registry.sh
```

### Link WSL to CRC (deprecated - only for Windows installs)
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

