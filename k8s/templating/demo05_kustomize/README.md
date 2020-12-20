# Kustomize

kubectl kustomize overlays/dev
kubectl kustomize overlays/prod

kubectl create ns dev
kubectl apply -k overlays/dev

kubectl get svc -n dev