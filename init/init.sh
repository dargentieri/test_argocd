echo "Setup target environment"
#!/bin/bash
#kubectl delete -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/secret-myapp.yaml -n myapp
kubectl apply -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/secret-myapp.yaml -n myapp
#kubectl delete -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/volume.yaml -n myapp
kubectl apply -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/volume.yaml -n myapp
#kubectl delete -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/secret-repo.yaml -n argocd   
#kubectl apply -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/secret-repo.yaml -n argocd  
#kubectl apply -f C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/application.yaml                    
kubectl -n myapp exec -it deployment/mysql -- mysql -u root -p123Stella < C:/Users/fc0882/Desktop/InProgress/ArgoCD/test_arcocd/test_argocd/init/dump.sql
kubectl exec -it --namespace=myapp deployment/webserver -- bash -c "echo '<style> table {   border-collapse: separate;   border-spacing: 0;   max-width: 100%;   width: 100%; }  th {   text-align: left;   font-weight: var(--table-header-font-weight); font-weight:bold; }  th, td {   padding: var(--table-cell-padding-y) var(--table-cell-padding-x);   line-height: inherit; }  th { vertical-align: bottom } td { vertical-align: top } </style> <?php 	echo \"Inside K8s with MySQL <br>\"; 	\$conn = new mysqli(\"mysql\", \"root\", \"123Stella\", \"sorgente\"); 	if (\$conn->connect_error) { 	 die(\"Connection failed: \" . \$conn->connect_error); 	} 	\$sql = \"SELECT * FROM tranche_s_target ORDER BY id_riga\"; 	\$result = \$conn->query(\$sql); 	if (\$result->num_rows > 0) 	{ 	echo \"<table><tr><th>id_riga</th><th>start_date</th><th>end_date</th><th>portafoglio</th></tr>\"; 	 while(\$row = \$result->fetch_assoc()) { 	  echo \"<tr><td>\".\$row[\"id_riga\"].\"</td><td>\".\$row[\"start_date\"].\"</td><td>\".\$row[\"end_date\"].\"</td><td>\".\$row[\"portafoglio\"].\"</td></tr>\"; 	 } 	} else {echo \"0 results\";} 	\$conn->close(); ?>' > index.php"
read n