#!/bin/bash

if [ $# -lt 1 ]
  then
    echo "Not enough arguments supplied. You must provide your Secret file location"
    exit 0
fi

TOOLS_DIR=$(dirname $0)
pullSecretLocation=${1}

# Ensure setup was done (and load env vars for crc binary)
${TOOLS_DIR}/setup_wsl2.sh

# Add your RedHat Openshift pull secret
crc --log-level debug start --pull-secret-file ${pullSecretLocation} --cpus 8 --memory 30000 --disk-size 64 --disable-update-check -n 1.1.1.1

${TOOLS_DIR}/setup_environment_after_start.sh

