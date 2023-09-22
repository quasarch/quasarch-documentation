REGISTRY:=ghcr.io/quasarch

release:
	docker build -t $(REGISTRY)/quasarch-docs:latest .
	docker push $(REGISTRY)/quasarch-docs:latest