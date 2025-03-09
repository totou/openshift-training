#!/bin/bash

# Ensure crc env is correct
eval $(crc oc-env)

# Ensure env for podman is correct
crc podman-env
eval $(crc podman-env)

# Login to internal registry
podman-remote login -u kubeadmin -p $(oc whoami -t) default-route-openshift-image-registry.apps-crc.testing --tls-verify=false

# Pull/tag/push most used images for the training
trainingImages="nginx:1.25.2 nginx:1.24.0 python:3.9.1-alpine"
for image in $trainingImages;
do
podman-remote pull ${image}
podman-remote tag ${image} default-route-openshift-image-registry.apps-crc.testing/default/${image}
podman-remote push default-route-openshift-image-registry.apps-crc.testing/default/${image}
podman-remote tag ${image} default-route-openshift-image-registry.apps-crc.testing/nginx/${image}
podman-remote push default-route-openshift-image-registry.apps-crc.testing/nginx/${image}
podman-remote tag ${image} default-route-openshift-image-registry.apps-crc.testing/myapp/${image}
podman-remote push default-route-openshift-image-registry.apps-crc.testing/myapp/${image}
done

# Ensure all images can be pulled locally
for imageStream in `oc get is -o custom-columns=IS:.metadata.name --no-headers`
do
    oc set image-lookup ${imageStream}
done
oc set image-lookup

# Give rights to all namespaces we will use the images for
oc policy add-role-to-group system:image-puller system:serviceaccounts:toolbox --namespace=default
oc policy add-role-to-group system:image-puller system:serviceaccounts:docker-builds --namespace=default
oc policy add-role-to-group system:image-puller system:serviceaccounts:nginx --namespace=default
oc policy add-role-to-group system:image-puller system:serviceaccounts:myapp --namespace=default
oc policy add-role-to-group system:image-puller system:serviceaccounts:my-app --namespace=default

