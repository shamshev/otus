https://manage.openshift.com/

export PATH=$(pwd):$PATH

1. Deploy application from command line

oc new-app https://github.com/openshift/ruby-hello-world.git
oc expose service/ruby-hello-world

2. Check status

oc status
oc get routes

3. Deploy application from template (UI)

4. Clean up

oc delete 
