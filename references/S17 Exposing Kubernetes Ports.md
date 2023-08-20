# Exposing Kubernetes Ports

## Service Types

- [Service Docs](https://kubernetes.io/docs/concepts/services-networking/service/)
- [Service Examples](https://kubernetes.io/docs/tutorials/services/)

```shell
kubectl expose
```

## Creating a ClusterIP Service

- [cURL utility](https://curl.se/)

```shell
kubectl get pods -w
kubectl create deployment httpenv --image=bretfisher/httpenv
kubectl scale deployment/httpenv --replicas=5
kubectl expose deployment/httpenv --port 8888
kubectl get service
kubectl run tmp-shell --rm -it --image bretfisher/netshoot -- bash
curl httpenv:8888
```

## Creating a NodePort and LoadBalancer Service

```shell
kubectl get all
kubectl expose deployment/httpenv --port 8888 --name httpenv-np --type NodePort
kubectl get services
curl localhost:32334
kubectl expose deployment/httpenv --port 8888 --name httpenv-lb --type LoadBalancer
kubectl get services
curl localhost:8888
kubectl delete service/httpenv service/httpenv-np
kubectl delete service/httpenv-lb deployment/httpenv
```

## Kubernetes Services DNS

- [Kubernetes DNS Specification](https://github.com/kubernetes/dns/blob/master/docs/specification.md)
- [CoreDNS for Kubernetes](https://coredns.io/plugins/kubernetes/)

```shell
curl <hostname>
kubectl get namespaces
curl <hostname>.<namespace>.svc.cluster.local
```
