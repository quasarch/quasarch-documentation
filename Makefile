REGISTRY:=ghcr.io/quasarch

build:
	docker build -t $(REGISTRY)/quasarch-docs:latest .

release: build
	docker push $(REGISTRY)/quasarch-docs:latest

release-amd64:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 $(MAKE) release

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

run: build
	docker run -p 1313:1313 $(REGISTRY)/quasarch-docs:latest
