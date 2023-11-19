
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

.PHONY: 2048
2048: ## 构建 2048 镜像
	docker build -t webgamedevelop/2048:latest -f 2048/Dockerfile 2048

.PHONY: 2048-push
2048-push: ## 推送 2048 镜像到 docker hub
	docker push webgamedevelop/2048:latest

.PHONY: battle-city
battle-city: ## 构建坦克大战镜像
	docker build -t webgamedevelop/battle-city:latest -f battle-city/Dockerfile battle-city

.PHONY: battle-city-push
battle-city-push: ## 推送坦克大战镜像到 docker hub
	docker push webgamedevelop/battle-city:latest

.PHONY: react-tetris
react-tetris: ## 构建俄罗斯方块镜像
	docker build -t webgamedevelop/react-tetris:latest -f react-tetris/Dockerfile react-tetris

.PHONY: react-tetris-push
react-tetris-push: ## 推送俄罗斯方块镜像到 docker hub
	docker push webgamedevelop/react-tetris:latest

.PHONY: super-mario
super-mario: ## 构建超级马里奥镜像
	docker build -t webgamedevelop/super-mario:latest -f super-mario/Dockerfile super-mario

.PHONY: super-mario-push
super-mario-push: ## 推送超级马里奥镜像到 docker hub
	docker push webgamedevelop/super-mario:latest
