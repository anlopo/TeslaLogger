#!/bin/bash

docker run -it --name=teslalogger \
  -v ../TeslaLogger/www:/var/www/html \
  -v ../TeslaLogger/bin:/etc/teslalogger \
  -v ../TeslaLogger/GrafanaDashboards/:/var/lib/grafana/dashboards/ \
  -v ../TeslaLogger/GrafanaPlugins/:/var/lib/grafana/plugins \
  -V ./docker/teslalogger/Dockerfile:/tmp/teslalogger-DOCKER \
  -v teslalogger-tmp:/tmp/ \
  -e TZ=Europe/Prague \
  -p 5010:5000 \
  teslalogger:latest
