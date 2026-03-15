#!/bin/bash

echo "🚨 Simulating production incident: Dropping the database/cache..."
kubectl delete pod -l app=redis -n sre

echo "🚨 Simulating massive pod failure in API tier..."
kubectl delete pods -l app=api -n sre

echo "📊 Watching the ReplicaSet immediately recreate the pods (Press Ctrl+C to stop)..."
kubectl get pods -n sre -w