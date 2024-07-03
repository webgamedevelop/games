PLATFORMS ?= linux/arm64,linux/amd64
BUILDER ?= builder
PROXY ?= host.lima.internal:7890
HTTP_PROXY ?= http://$(PROXY)
HTTPS_PROXY ?= http://$(PROXY)

##@ General

.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Environment

.PHONY: builder
builder: ## create builder
	- docker buildx create \
	  --use \
	  --driver=docker-container \
	  --name=$(BUILDER) \
	  --driver-opt=image=moby/buildkit:buildx-stable-1 \
	  --driver-opt=network=host \
	  --driver-opt=env.http_proxy=$(PROXY) \
	  --driver-opt=env.https_proxy=$(PROXY)

.PHONY: rm-builder
rm-builder: ## remove builder
	docker buildx rm $(BUILDER)

##@ Build

.PHONY: snake
snake: builder ## 构建贪吃蛇镜像并推送到 docker hub
	docker buildx build --push --platform=$(PLATFORMS) --tag webgamedevelop/snake:latest -f snake_game/Dockerfile snake_game

.PHONY: 2048
2048: builder ## 构建 2048 镜像并推送到 docker hub
	docker buildx build \
	  --push \
	  --platform=$(PLATFORMS) \
	  --build-arg HTTP_PROXY=$(HTTP_PROXY) \
	  --build-arg HTTPS_PROXY=$(HTTPS_PROXY) \
	  --tag webgamedevelop/2048:latest \
	  -f 2048/Dockerfile \
	  2048

.PHONY: battle-city
battle-city: builder ## 构建坦克大战镜像并推送到 docker hub
	docker buildx build \
	  --push \
	  --platform=$(PLATFORMS) \
	  --build-arg HTTP_PROXY=$(HTTP_PROXY) \
	  --build-arg HTTPS_PROXY=$(HTTPS_PROXY) \
	  --tag webgamedevelop/battle-city:latest \
	  -f battle-city/Dockerfile \
	  battle-city

.PHONY: react-tetris
react-tetris: builder ## 构建俄罗斯方块镜像并推送到 docker hub
	docker buildx build \
	  --push \
	  --platform=$(PLATFORMS) \
	  --build-arg HTTP_PROXY=$(HTTP_PROXY) \
	  --build-arg HTTPS_PROXY=$(HTTPS_PROXY) \
	  --tag webgamedevelop/react-tetris:latest \
	  -f react-tetris/Dockerfile \
	  react-tetris

.PHONY: super-mario
super-mario: builder ## 构建超级马里奥镜像并推送到 docker hub
	docker buildx build \
	  --push --platform=$(PLATFORMS) \
	  --build-arg HTTP_PROXY=$(HTTP_PROXY) \
	  --build-arg HTTPS_PROXY=$(HTTPS_PROXY) \
	  --tag webgamedevelop/super-mario:latest \
	  -f super-mario/Dockerfile \
	  super-mario
