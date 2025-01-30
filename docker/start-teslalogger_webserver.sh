#!/bin/bash

docker run -it --name=teslalogger_webserver \
  -v ./docker/webserver/php.ini:/usr/local/etc/php/php.ini \
  -v ../TeslaLogger/www:/var/www/html \
  -v ../TeslaLogger/bin:/etc/teslalogger \
  -V ../docker/teslalogger/Dockerfile:/tmp/teslalogger-DOCKER \
  -v ../TeslaLogger/GrafanaConfig/datasource.yaml:/tmp/datasource-DOCKER \
  -v teslalogger-tmp:/tmp/ \
  -e TZ=Europe/Prague \
  -p 8888:80 \
  teslalogger_webserver:latest
