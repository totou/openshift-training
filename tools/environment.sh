#!/bin/bash

# Please source this file

# https://github.com/crc-org/crc/releases
CRC_VERSION=2.47.0
# https://github.com/helm/helm/releases
HELM_VERSION=3.17.1

OPENSHIFT_LOCAL_CRC_INSTALL_FOLDER="openshift-local-installation"
export PATH=${PATH}:~/${OPENSHIFT_LOCAL_CRC_INSTALL_FOLDER}/crc-linux-${CRC_VERSION}-amd64

