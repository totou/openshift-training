#!/bin/bash

# Retrieve credentials and setup new environment
crc console --credentials
eval $(crc oc-env)
crc podman-env
eval $(crc podman-env)

# Login as kubeadmin
oc login -u kubeadmin -p admin https://api.crc.testing:6443

