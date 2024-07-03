FROM bitnami/git:latest AS builder

WORKDIR /workspace
RUN git clone https://github.com/gabrielecirulli/2048.git

FROM nginx:1.25.3
COPY --from=builder /workspace/2048/ /usr/share/nginx/html/
