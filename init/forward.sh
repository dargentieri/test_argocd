#!/bin/bash
echo "Start port-forward argo workflow - argocd - mysql"
kubectl port-forward -n argocd svc/argocd-server 8080:443 & 
kubectl -n argo port-forward deployment/argo-server 2746:2746 &
kubectl port-forward -n myapp deployment/mysql 3307:3306 & 
read n
