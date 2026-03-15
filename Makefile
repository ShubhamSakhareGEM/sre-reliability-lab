.PHONY: cluster build load deploy test clean

cluster:
	sh scripts/cluster-setup.sh

build:
	docker build -t api-service:latest ./services/api-service

load:
	kind load docker-image api-service:latest --name sre-lab

deploy: build load
	kubectl apply -f infrastructure/kubernetes/namespace.yaml
	kubectl apply -f infrastructure/kubernetes/

test:
	sh scripts/load-test.sh

clean:
	kind delete cluster --name sre-lab