# Exercise SCC

oc policy add-role-to-user system:image-puller system:serviceaccount:nginx:nginx-sa -n default

Ensure the nginx can start in a new nginx project
Hint: nginx containers is not restricted compliant
Create a new anyuid SCC (harder) or ensure your user can access another compliant SCC
Bonus: use the privileged scc (overkill)

