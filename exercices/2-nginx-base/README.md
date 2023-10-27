# Base deployment for NGINX

Goal is to start 2 different objects for a simple NGINX

## Useful commands

For the object creation
```
oc create -f <file.yaml>
oc apply -f <file.yaml>
oc replace -f <file.yaml>
oc delete -f <file.yaml>
```

Look at the Openshift object
```
oc get pods
oc get pods -o yaml <pod>
oc get deployment
oc get deploymentconfig
oc get replicaset
oc get replicationcontroller
```

