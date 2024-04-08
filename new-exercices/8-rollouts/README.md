# Rollouts

For simplicity this will be done in "default" project
```
oc project default
```

## Prerequisites
```
export target_node=$(oc get node --no-headers -o name|cut -d'/' -f2)
oc debug node/${target_node}
chroot /host
mkdir -p /tmp/my-local-pv
chcon -Rvt /tmp/my-local-pv
```

##  Exercise

Update the version of your application and see how it behaves
Notice the difference between Deployment, DeploymentConfig, StatefulSet

Advanced/Bonus - if time permits:
- Add some pre/post step to your DeploymentConfig
- Fully customise your rollout (not just pre/post)
