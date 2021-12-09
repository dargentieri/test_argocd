#!/bin/bash
kubectl delete -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/secret-myapp.yaml -n myapp
kubectl apply -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/secret-myapp.yaml -n myapp
#kubectl delete -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/secret-repo.yaml -n argocd   
#kubectl apply -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/secret-repo.yaml -n argocd  
#kubectl apply -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/application.yaml                    
kubectl exec -it deployment/mysql -- mysql -u root -p123Stella < C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/dump.sql -n myapp