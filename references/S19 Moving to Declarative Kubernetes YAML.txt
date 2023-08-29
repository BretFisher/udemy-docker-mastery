# Moving to Declarative Kubernetes YAML

## Kubectl Apply

kubectl apply -f filename.yml

kubectl apply -f myfile.yaml

kubectl apply -f myyaml/

kubectl apply -f https://bret.run/pod.yml

curl -L https://bret.run/pod

start https://bret.run/pod.yml

## Building Your YAML Files

kubectl api-resources

kubectl api-versions

## Dry Runs and Diffs

kubectl apply -f app.yml --dry-run

kubectl apply -f app.yml --server-dry-run

kubectl diff -f app.yml

## Labels and Label Selectors

kubectl get pods -l app=nginx

kubectl apply -f myfile.yaml -l app=nginx

kubectl get all

kubectl delete <resource type>/<resource name>



