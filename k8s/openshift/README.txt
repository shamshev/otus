https://manage.openshift.com/

export PATH=$(pwd):$PATH

1. Create MongoDB instance

oc new-app --name=mongodb openshift/mongodb-24-centos7 -e MONGODB_USER=reddit -e MONGODB_PASSWORD=reddit -e MONGODB_DATABASE=testdb -e MONGODB_ADMIN_PASSWORD=password

2. Deploy application

oc new-app ruby:2.4~https://github.com/express42/reddit -e DATABASE_URL=mongodb:27017 -e DATABASE_USER=reddit -e DATABASE_PASS=reddit -e DATABASE_NAME=testdb
oc expose svc/reddit

3. Check status

oc status
oc get routes

4. Clean up

oc delete all -l app=reddit
oc delete all -l app=mongodb

