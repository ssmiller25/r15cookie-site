git_hash = $(shell git rev-parse --short -q HEAD)
version := 0.10.0
release_date := $(shell date +%Y-%m-%d)
alpine_version := 3.13.1
nginx_version := 1.19.6

DOCKER_REPO=quay.io/ssmiller25

CIVO_CMD="civo"
# For Dockerize CIVO
#CIVO_CMD=docker run -it --rm -v /home/steve/.civo.json:/.civo.json civo/cli:latest

CLUSTER_NAME=blog
CIVO_SIZE=g2.small
KUBECONFIG=kubeconfig.$(CLUSTER_NAME)
KUBECTL=kubectl --kubeconfig=$(KUBECONFIG)


.PHONY: build
build: 
	@docker build . -t ${DOCKER_REPO}/r15cookieblog:${git_hash} \
		$(docker_extra_param) \
		--build-arg GIT_HASH=${git_hash} \
		--build-arg VERSION=${version} \
		--build-arg RELEASE_DATE=${release_date} \
		--build-arg ALPINE_VERSION=${alpine_version} \
		--build-arg NGINX_VERSION=${nginx_version}
	@docker tag ${DOCKER_REPO}/r15cookieblog:${git_hash} ${DOCKER_REPO}/r15cookieblog:latest

.PHONY: build-nocache
build-nocache: docker_extra_param=--no-cache
build-nocache: build


.PHONY: run
run:
	@docker run -d --rm -p 8080:80 --name r15cookieblog ${DOCKER_REPO}/r15cookieblog:latest 
	@echo "Local running.  Go to http://localhost:8080/ to view"

.PHONY: stop
stop:
	@echo "Stopping r15cookieblog - should shelf-cleanup"
	@docker stop r15cookieblog

.PHONY: push
push:
	@docker push ${DOCKER_REPO}/r15cookieblog:$(git_hash)
	@docker push ${DOCKER_REPO}/r15cookieblog:latest

# Pull and cache dependent images
.PHONY: cache-upstream
cache-upstream:
	docker pull alpine:${alpine_version} 
	docker pull nginx:${nginx_version}
	docker tag alpine:${alpine_version} $(DOCKER_REPO)/alpine:${alpine_version}
	docker tag nginx:${nginx_version} $(DOCKER_REPO)/nginx:${nginx_version}
	docker push $(DOCKER_REPO)/alpine:${alpine_version} 
	docker push $(DOCKER_REPO)/nginx:${nginx_version}


.PHONY: civo-up
civo-up: $(KUBECONFIG)

$(KUBECONFIG):
	@echo "Creating $(CLUSTER_NAME)"
	@$(CIVO_CMD) k3s list | grep -q $(CLUSTER_NAME) || $(CIVO_CMD) k3s create $(CLUSTER_NAME) -n 1 --size $(CIVO_SIZE) --wait
	@$(CIVO_CMD) k3s config $(CLUSTER_NAME) > $(KUBECONFIG)

.PHONY: civo-down
civo-down:
	@echo "Removing $(CLUSTER_NAME)"
	@$(CIVO_CMD) k3s remove $(CLUSTER_NAME) || true
	@rm $(KUBECONFIG)

.PHONY: civo-deploy
civo-deploy: $(KUBECONFIG)
	@$(KUBECTL) apply -k ./

civo-env: $(KUBECONFIG)
	export KUBECONFIG=$(KUBECONFIG)
