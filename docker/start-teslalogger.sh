#!/bin/bash

docker run -d --name=teslalogger \
  -v $(pwd)/../TeslaLogger/www:/var/www/html \
  -v $(pwd)/../TeslaLogger/bin:/etc/teslalogger \
  -v $(pwd)/../TeslaLogger/GrafanaDashboards/:/var/lib/grafana/dashboards/ \
  -v $(pwd)/../TeslaLogger/GrafanaPlugins/:/var/lib/grafana/plugins \
  -v $(pwd)/teslalogger/Dockerfile:/tmp/teslalogger-DOCKER \
  -v teslalogger-tmp:/tmp/ \
  -e TZ=Europe/Prague \
  -p 5010:5010 \
  teslalogger:latest
