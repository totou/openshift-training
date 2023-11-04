# Exercise RBAC

Goal is to give rights to `nginx-sa` service account in new project `nginx`

## Useful commands

```
oc delete project nginx
oc login --token $(oc sa get-token nginx-sa)
oc whoami
oc adm who-can use scc anyuid
oc adm who-can get secrets
```

## Bonus exercise

Create a new ServiceAccount in project `mytoolbox` and give it rights to read secrets
Use this service account in a Deployment with kubectl/oc and check it can do what you wanted (use the my-toolbox and change the service account to the one you created for example)
Doc avec examples sur les roles: https://kubernetes.io/docs/reference/access-authn-authz/rbac/

### Other useful commands
```
oc project mytoolbox
oc create sa test
oc exec -ti my-toolbox-65595675c8-d27l8 -- bash
system:serviceaccount:mytoolbox:test
```


