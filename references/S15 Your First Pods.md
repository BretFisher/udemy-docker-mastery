# Your First Pods

> Shell commands and reference links, per lecture

## Our First Pod With Kubectl run

- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Kubectl Commands for Docker Users](https://kubernetes.io/docs/reference/kubectl/docker-cli-to-kubectl/)

```shell
kubectl version
kubectl version --short
kubectl run my-nginx --image nginx
kubectl get pods
kubectl get all
```

## Your First Deployment with kubectl create

```shell
kubectl create deployment my-nginx --image nginx
kubectl get pods
kubectl get all
kubectl delete pod my-nginx
kubectl delete deployment my-nginx
```

## Scaling ReplicaSets

```shell
kubectl create deployment my-apache --image httpd
kubectl get all
kubectl scale deploy/my-apache --replicas 2
kubectl get all
```
