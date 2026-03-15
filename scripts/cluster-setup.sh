#!/bin/bash
# Create Kind cluster with extra port mappings for Ingress
cat <<EOF | kind create cluster --name sre-lab --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
EOF

echo "Creating namespaces..."
kubectl create namespace sre
kubectl create namespace monitoring
kubectl create namespace argocd

echo "Installing NGINX Ingress..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

echo "Cluster is ready!"