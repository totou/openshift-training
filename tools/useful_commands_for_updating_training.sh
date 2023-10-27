# Useful commands for trainer ! (probably not for trainees)

# Change from old version to nez version of nginx everywhere
oldVersion="1.19.6"
newVersion="1.25.2"
grep "image: nginx:${oldVersion}" -R * -l | xargs sed -i "s#image: nginx:${oldVersion}#image: image-registry.openshift-image-registry.svc:5000/default/nginx:${nezVersion}#g"

