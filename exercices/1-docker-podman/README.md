# Docker/Podman exercise

Locally build using the PodMan provided by CRC.

For consistency with the rest of the exercises, I recommend that you make changes onto "nginx:1.25.2" or newer version

## Commands to play

### Build and tag your image
```
podman-remote build -t my-nginx-image .
```

### Verify your build did what you expect
Check that your file is in it by checking the `/usr/share/nginx/html/` location
```
podman-remote run --rm -ti --entrypoint bash my-nginx-image
```

### Inspect the layers
You can inspect layers with
```
podman-remote inspect my-nginx-image
```

### Push to the local registry of Openshift
Tag and then push in default namespace
```
podman-remote tag my-nginx-image default-route-openshift-image-registry.apps-crc.testing/default/my-nginx-image
podman-remote push default-route-openshift-image-registry.apps-crc.testing/default/my-nginx-image
# To be able to use it
oc set image-lookup my-nginx-image
```

