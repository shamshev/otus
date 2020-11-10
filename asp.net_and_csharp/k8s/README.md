# k8s examples for asp.net

0. General


`kubectl api-resources -o name`

`kubectl get nodes`

`kubectl describe node $nodename`

`kubectl get pods - n kube-system`


1. Pod


`kubectl apply -f 01_pod.yml`

`kubectl logs myapp-something`

`kubectl delete pod my-pod`


2. Namespace


`kubectl create namespace otus`

`kubectl get namespaces`

`kubectl apply -f 02_pod_with_namespace.yml`

`kubectl get pods`

`kubectl get pods -n otus`

`kubectl delete pod ...`


3. Deployments


`kubectl apply -f 03_deployment.yml`

`kubectl delete pod ...`

`kubectl delete deployments.apps ...`


4. Vars


`kubectl apply -f 04_env_vars.yml`

`kubectl delete pod ...`


5. Config map


`kubectl apply -f 05_config_map.yml`

`kubectl exec -it myapp-something -- sh`

`echo $MY_VARIABLE`

`exit`


6. Resources


`kubectl apply -f 06_resources.yml`


7. Resources


`kubectl apply -f 07_probes.yml`


8. Labels


`kubectl apply -f 08_labels.yml`

`kubectl get pods -l app=myapp`

`kubectl get pods -l 'environment in (test,prod)'`


9. Rolling update


`kubectl apply -f 09_rolling_update.yml`


10. Service


`kubectl apply -f 10_service.yml`
