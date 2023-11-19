FROM bitnami/git:latest as builder

WORKDIR /workspace
RUN git clone https://github.com/martindrapeau/backbone-game-engine.git

FROM nginx:1.25.3
COPY --from=builder /workspace/backbone-game-engine/super-mario-bros /usr/share/nginx/html
COPY --from=builder /workspace/backbone-game-engine/3rd /usr/share/nginx/html/3rd
COPY --from=builder /workspace/backbone-game-engine/src /usr/share/nginx/html/src
