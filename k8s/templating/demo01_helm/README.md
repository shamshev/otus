# Устанавливаем helm3

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Устанавливаем публичные чарты

## Nginx ingress

url: https://github.com/helm/charts/tree/master/stable/nginx-ingress
url new: https://github.com/kubernetes/ingress-nginx/tree/master/charts/ingress-nginx

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm search hub ingress-nginx
kubectl create ns ingress-nginx
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --version 3.15.2
helm list --namespace ingress-nginx

## Harbor

helm repo add harbor https://helm.goharbor.io
helm search hub harbor

### Идем в файл values.yaml, смотрим как настраивается ingress.

url: https://github.com/goharbor/harbor-helm/blob/master/values.yaml
helm fetch harbor/harbor --untar

### Создаем новый файл harbor.yaml (уже создан) и кастомизируем настройку:

kubectl get svc -n ingress-nginx - вписываем IP отсюда.

### Устанавливаем chart

kubectl create ns harbor
helm upgrade --install harbor harbor/harbor --namespace harbor -f harbor.yaml

### Заходим в web, проверяем что все работает

kubectl get ingress -n harbor

Креды admin/admin
https!!!