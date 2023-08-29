# Kubernetes Management Techniques

## YAML Generators in kubectl Commands

- [kubectl Usage Conventions and Best Practices](https://kubernetes.io/docs/reference/kubectl/conventions/)

```shell
kubectl create deployment test --image nginx --dry-run=client
kubectl create deployment test --image nginx --dry-run=client -o yaml
kubectl create job test --image nginx -dry-run=client -o yaml
kubectl expose deployment/test --port 80 --dry-run=client -o -yaml
kubectl create deployment test --image nginx
kubectl expose deployment/test --port 80 --dry-run=client -o -yaml
kubectl delete deployment test
```
## Three Management Approaches

- [Kubernetes Object Management](https://kubernetes.io/docs/concepts/overview/working-with-objects/object-management/)
- [Managing Kubernetes Objects Using Imperative Commands](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/imperative-command/)
- [Imperative Management of Kubernetes Objects Using Configuration Files](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/imperative-config/)
- [Declarative Management of Kubernetes Objects Using Configuration Files](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/)