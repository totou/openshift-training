#!/bin/bash

# Setup (repeat in case of failure)
echo "Cleanup of any previous installation"
crc --log-level debug cleanup
echo "Setup of CRC... if it fails, retry it once or twice..."
crc --log-level debug setup
# Second time!
# crc --log-level debug setup
crc --log-level debug config set consent-telemetry no
crc --log-level debug config set enable-cluster-monitoring true
crc --log-level debug config set kubeadmin-password admin
# crc config set enable-bundle-quay-fallback true

echo "To continue and start the cluster, ensure that you have your pull-secret!"

