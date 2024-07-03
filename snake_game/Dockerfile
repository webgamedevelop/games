FROM bitnami/git:latest AS builder

WORKDIR /workspace
RUN git clone https://github.com/RabiRoshan/snake_game.git

FROM nginx:1.25.3
COPY --from=builder /workspace/snake_game/docs/* /usr/share/nginx/html/
