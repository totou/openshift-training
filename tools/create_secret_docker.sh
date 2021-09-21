
oc project myapp
oc create secret docker-registry training --docker-username=traintrain --docker-password=traintrain --docker-email=negaw26020@stvbz.com
oc secret link default training --for=pull
oc secret link builder training --for=pull

