# Exercise RBAC

```
oc delete project nginx
oc login --token $(oc sa get-token nginx-sa)
oc whoami
oc adm who-can use scc anyuid
oc adm who-can get secrets
```

Create a new ServiceAccount in mytoolbox and give it rights to read secrets
Use this service account in a Deployment with kubectl/oc and check it can do what you wanted (use the my-toolbox and change the service account to the one you created for example)
Doc avec examples sur les roles: https://kubernetes.io/docs/reference/access-authn-authz/rbac/
```
oc project mytoolbox
oc exec -ti my-toolbox-65595675c8-d27l8 -- bash
system:serviceaccount:mytoolbox:test
```


