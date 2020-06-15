# Manual configuration
APP ?= argo_repo

# Docker configuration
DOCKER_CR ?= maerskao.azurecr.io
DOCKER_IMAGE_APP ?= $(DOCKER_CR)/$(APP):$(DOCKER_IMAGE_TAG)
DOCKER_IMAGE_TAG ?= $(GIT_COMMIT)

# Static variables
GIT_COMMIT = $(shell git log -1 --pretty=format:"%H")

docker_build:
	cd src; docker build -t "$(DOCKER_IMAGE_APP)" .
.PHONY: docker_build

docker_run_app: docker_build
	docker run --rm "$(DOCKER_IMAGE_APP)"
.PHONY: docker_run_app

docker_push:
	docker push "$(DOCKER_IMAGE_APP)"
.PHONY: docker_push
