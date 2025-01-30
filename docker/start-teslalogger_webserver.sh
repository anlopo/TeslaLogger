#!/bin/bash

docker run -it --name=teslalogger_webserver \
  -v $(pwd)/docker/webserver/php.ini:/usr/local/etc/php/php.ini \
  -v $(pwd)/../TeslaLogger/www:/var/www/html \
  -v $(pwd)/../TeslaLogger/bin:/etc/teslalogger \
  -v $(pwd)/../docker/teslalogger/Dockerfile:/tmp/teslalogger-DOCKER \
  -v $(pwd)/../TeslaLogger/GrafanaConfig/datasource.yaml:/tmp/datasource-DOCKER \
  -v teslalogger-tmp:/tmp/ \
  -e TZ=Europe/Prague \
  -p 8888:80 \
  teslalogger_webserver:latest
