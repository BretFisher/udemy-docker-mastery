# Inspecting Kubernetes Resources

## Inspecting Resources with Get

```shell
kubectl get all
kubectl create deployment my-apache --image httpd --replicas 2
kubectl get all -o wide
kubectl get deploy/my-apache -o yaml
```

## Inspecting Resources with Describe

```shell
kubectl describe deploy/my-apache
kubectl describe pod/my-apache-xxxx-yyyy
kubectl get nodes
kubectl get node/docker-desktop -o wide
kubectl describe node/docker-desktop
```

## Watching Resources

```shell
# in first window
kubectl get pods -w
# in second window
kubectl delete pod/my-apache-xxxx-yyyy
# in first window
kubectl get events
kubectl get events --watch-only
# in second window
kubectl delete pod/my-apache-xxxx-yyyy
```

## Container Logs in Kubernetes

- [System Logs](https://kubernetes.io/docs/concepts/cluster-administration/system-logs/)
- [Debug Running Pods](https://kubernetes.io/docs/tasks/debug/debug-application/debug-running-pod/)
- [Logging Architecture](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
- [Loki - Like Prometheus, but for logs](https://github.com/grafana/loki)
- [ELK Stack](https://www.elastic.co/what-is/elk-stack)
- [Stern multi-pod log tailing](https://github.com/stern/stern)

```shell
kubectl logs deploy/my-apache
kubectl logs deploy/my-apache --follow --tail 1
kubectl logs pod/my-apache-xx-yy -c httpd
kubectl logs pod/my-apache-xx-yy --all-containers=true
kubectl logs -l app=my-apache
# cleanup
kubectl delete deployment my-apache
```
