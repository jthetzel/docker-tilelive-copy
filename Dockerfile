FROM ubuntu:16.04
MAINTAINER Kristofor Carle <kris@maphubs.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y wget git curl libssl-dev openssl nano unzip python build-essential g++ gdal-bin awscli && \
    curl -sL https://deb.nodesource.com/setup_4.x | bash &&\
    apt-get install -y nodejs && \
    npm install -g yarn@0.16.1 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /app

WORKDIR /app

COPY package.json yarn.lock /app/
RUN yarn install --production --pure-lockfile

COPY ./configs /configs

COPY ./docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["node", "node_modules/tl/bin/tl.js"]