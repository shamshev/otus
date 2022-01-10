# demo01

```
kubectl apply -f 01_pod_w_volume
kubectl get pods
kubectl exec -it demo01 -- /bin/sh
df -h
```

node:

```
df -h
crictl ps | grep test
crictl inspect id | less
```

search binding information

```
cd dir
touch file
```

check file in container

`free -m`

# demo02

```
kubectl apply -f 01_pv.yml
kubectl get pv
kubectl apply -f 02_pvc.yml
kubectl get pv
kubectl get pvc
kubectl apply -f 03_pod.yml
kubectl exec -it demo02-pod -- /bin/sh
cd test
touch foo && touch bar
```

node:

`ls -la /mnt`

# demo03

```
kubectl delete -f 02_pvc.yml 
kubectl get pvc
kubectl delete -f 03_pod.yml
kubectl get pvc
kubectl get pv

kubectl edit pv demo02-pv
```

delete claimRef

# demo04

```
kubectl apply -f 01_pvc.yml
kubectl get pvc
kubectl get pvc demo04-pvc -o yaml | less
kubectl get sc

kubectl apply -f 02_pvc_empty.yml
kubectl get pvc

kubectl apply -f 03_pv_empty.yml
kubectl get pv
kubectl get pvc
```

# demo05

```
mkdir -p /etc/systemd/system/k3s.service.d/
cat <<EOF > /etc/systemd/system/k3s.service.d/mount_propagation_flags.conf
[Service]
MountFlags=shared
EOF
systemctl daemon-reload
```

`./deploy_snap.sh`

https://github.com/kubernetes-csi/csi-driver-host-path

```
./git_clone.sh
./csi-driver-host-path/deploy/kubernetes-latest/deploy.sh
kubectl get pods
```

# demo06

```
kubectl apply -f 01_storageclass.yml
kubectl get sc

kubectl apply -f 02_pvc.yml
kubectl get pvc
kubectl get pv

kubectl apply -f 03_pod_pvc.yml
kubectl exec -it demo06-pod -- /bin/sh
echo "data" > /test/foo

kubectl apply -f 04_snapshotclass.yml
kubectl apply -f 05_snapshot.yml
kubectl get volumesnapshot

kubectl delete pod demo06-pod
kubectl delete pvc hpvc

kubectl apply -f 06_restore.yml
ls -la /var/lib/csi-hostpath-data
kubectl apply -f 03_pod_pvc.yml
kubectl exec -it demo06-pod -- /bin/sh
cat /test/foo
```