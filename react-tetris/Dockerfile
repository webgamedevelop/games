FROM bitnami/git:latest AS builder

WORKDIR /workspace
RUN git clone https://github.com/chvin/react-tetris.git

FROM nginx:1.25.3
COPY --from=builder /workspace/react-tetris/docs /usr/share/nginx/html
