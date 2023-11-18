
.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Build

.PHONY: snake
snake: ## 构建贪吃蛇镜像
	docker build -t webgamedevelop/snake:latest -f snake_game/Dockerfile snake_game

.PHONY: snake-push
snake-push: ## 推送贪吃蛇镜像到 docker hub
	docker push webgamedevelop/snake:latest
