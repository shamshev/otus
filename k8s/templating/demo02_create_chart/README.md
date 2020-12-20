# Helm

### Показываем набор манифестов из socks-shop в all.yaml

### Создаем заготовку helm-chart

helm create socks-shop

### Показываем что создалось после инициализации
### Удаляем ненужное

rm -rf socks-shop/templates/*
rm -rf socks-shop/values.yaml

### Переносим all.yaml в templates

cp all.yaml socks-shop/templates/
helm template .

### Устанавливаем release

kubectl create ns socks-shop
helm upgrade --install socks-shop ./socks-shop --namespace socks-shop
kubectl get pods -n socks-shop

### Идем на адрес любой ноды и проверяем, что магазин работает

kubectl get svc -n socks-shop | grep front-end
gcloud compute firewall-rules create sock-shop --allow tcp:30001
kubectl get pods -n socks-shop -o wide | grep front-end
kubectl get nodes -o wide | grep <change_me>


### Генерируем документацию

helm-docs md frontend

### Пакуем в tgz

helm package frontend