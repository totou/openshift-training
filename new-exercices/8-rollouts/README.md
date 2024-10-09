# Rollouts

For simplicity this will be done in "default" project
```
oc project default
```

## Prerequisites
In order to have rights on the hostPath we need to do this workaround.
Source: https://developers.redhat.com/articles/2022/04/20/create-and-manage-local-persistent-volumes-codeready-containers#
```
export target_node=$(oc get node --no-headers -o name|cut -d'/' -f2)
oc debug node/${target_node}
chroot /host
mkdir -p /tmp/my-local-pv
chcon -Rvt svirt_sandbox_file_t /tmp/my-local-pv
```

##  Exercise

Update the version of your application and see how it behaves
Notice the difference between Deployment, DeploymentConfig, StatefulSet

Advanced/Bonus - if time permits:
- Add some pre/post step to your DeploymentConfig
- Fully customise your rollout (not just pre/post)
