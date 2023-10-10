REGISTRY:=ghcr.io/quasarch

release:
	docker build -t $(REGISTRY)/quasarch-docs:latest .
	docker push $(REGISTRY)/quasarch-docs:latest

apply:
	kubectl apply -f deploy/k8s.yaml
	kubectl create secret docker-registry regcred \
    		--docker-server=$(DOCKER_REGISTRY) \
    		--docker-username=$(GITHUB_USER) \
    		--docker-password=$(GITHUB_TOKEN) \
    		-n docs --dry-run=client -o yaml | kubectl apply -f -

delete:
	kubectl delete -f deploy/k8s.yaml
	kubectl delete secret regcred -n docs

run:
	docker run $(REGISTRY)/quasarch-docs:latest