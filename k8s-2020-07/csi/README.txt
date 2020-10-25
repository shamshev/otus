# demo01

`kubectl apply -f 01_pod_w_volume`
`kubectl get pods`
`kubectl exec -it demo01 -- /bin/sh`
`df -h`

node:
`df -h`
`crictl ps | grep test`
`crictl inspect id | less`

search binding information

`cd dir`
`touch file`

check file in container

`free -m`

# demo02

`kubectl apply -f 01_pv.yml`
`kubectl get pv`
`kubectl apply -f 02_pvc.yml`
`kubectl get pv`
`kubectl get pvc`
`kubectl apply -f 03_pod.yml`
`kubectl exec -it demo02-pod -- /bin/sh`
`cd test`
`touch foo && touch bar`

node:
`ls -la /mnt`

# demo03

`kubectl delete -f 02_pvc.yml` 
`kubectl get pvc`
`kubectl delete -f 03_pod.yml`
`kubectl get pvc`
`kubectl get pv`

`kubectl edit pv demo02-pv`
delete claimRef

# demo04

`kubectl apply -f 01_pvc.yml`
`kubectl get pvc`
`kubectl get pvc demo04-pvc -o yaml | less`
`kubectl get sc`

`kubectl apply -f 02_pvc_empty.yml`
`kubectl get pvc`

`kubectl apply -f 03_pv_empty.yml`
`kubectl get pv`
`kubectl get pvc`

# demo05

`./deploy_snap.sh`
`git clone https://github.com/kubernetes-csi/csi-driver-host-path.git`
`cd csi-driver-host-path && git checkout release-1.4`
`deploy/kubernetes-latest/deploy.sh`
`kubectl get pods`

# demo06