# scripts/deploy.sh

#!/bin/bash

echo "Creating namespace..."
kubectl apply -f k8s/namespace.yaml

echo "Deploying blue..."
kubectl apply -f k8s/blue-deployment.yaml
kubectl apply -f k8s/blue-service.yaml

echo "Deploying green..."
kubectl apply -f k8s/green-deployment.yaml
kubectl apply -f k8s/green-service.yaml

echo "Creating ingress..."
kubectl apply -f k8s/ingress.yaml

echo "Waiting for external IP..."
kubectl get ingress -n prod -w
