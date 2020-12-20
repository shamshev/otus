# Kubcfg

### Рассказываем, что есть jsonnet шаблон из которого генерируется yaml конфигурация.

### Смотрим сгенерированную конфигурацию:

kubecfg show workers.jsonnet

### Применяем

kubecfg update workers.jsonnet

### Смотрим node port и идем в браузер

kubectl get svc
kubectl get nodes -o wide
gcloud compute firewall-rules create test-node-port --allow tcp:<port>

### Добавляем второй worker

### Применяем

kubecfg update workers.jsonnet

### Смотрим node port и идем в браузер

kubectl get svc
kubectl get nodes -o wide