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