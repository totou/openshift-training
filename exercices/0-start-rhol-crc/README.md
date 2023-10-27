# Goal

Familiarise yourself with CRC / Openshift Local.

You should start your cluster, access the GUI (Console), access the command line.

# Various Commands

```
#sudo apt install qemu-kvm libvirt-daemon libvirt-daemon-system network-manager
#cd <crc folder>
#export PATH=$PATH:$PWD
```

# Replace the pull secret with yours
```
crc --log-level debug setup
crc --log-level debug delete
crc --log-level debug config set enable-cluster-monitoring true
crc --log-level debug config set kubeadmin-password admin
crc --log-level debug config set consent-telemetry no
crc --log-level debug start --pull-secret-file red-hat-crc-pull-secret.txt --cpus 6 --memory 28000 --disable-update-check -n 1.1.1.1
```

# Retrieve credentials
```
crc console --credentials
```

# Login
```
oc login -u kubeadmin -p admin https://api.crc.testing:6443
```

# Retrieve Cluster access
```
crc console
crc console --credentials
https://console-openshift-console.apps-crc.testing/
```

# Login to the cluster - unix version
```
# eval $(crc oc-env)
oc login -u kubeadmin -p admin https://api.crc.testing:6443
```

# Delete cluster
```
crc --log-level debug delete
# And if that does not work ...
crc --log-level debug delete -f
```



