# demo01

```
kubectl create configmap config-nginx-from-file --from-file=02_site.conf
kubectl create configmap config-nginx-from-file --from-file=02_site.conf -o yaml --dru-run | kubectl replace -f -
```
