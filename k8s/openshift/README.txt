https://manage.openshift.com/

export PATH=$(pwd):$PATH

1. Create MongoDB instance

oc new-app --name=mongodb openshift/mongodb-24-centos7 -e MONGODB_USER=reddit -e MONGODB_PASSWORD=reddit -e MONGODB_DATABASE=testdb -e MONGODB_ADMIN_PASSWORD=password

2. Deploy application

oc new-app https://github.com/openshift/ruby-hello-world.git
oc expose service/ruby-hello-world

3. Check status

oc status
oc get routes

4. Clean up

oc delete 
