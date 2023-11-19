FROM node:16 as builder

WORKDIR /workspace
RUN git clone https://github.com/shinima/battle-city.git && \
    cd battle-city && \
    yarn install && \
    yarn build

FROM nginx:1.25.3
COPY --from=builder /workspace/battle-city/dist /usr/share/nginx/html
