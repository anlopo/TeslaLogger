#!/bin/bash

docker run -it --name=teslalogger_grafana \
  -v ../TeslaLogger/bin:/etc/teslalogger \
  -v ../TeslaLogger/GrafanaDashboards/:/var/lib/grafana/dashboards/ \
  -v ../TeslaLogger/GrafanaPlugins/:/var/lib/grafana/plugins \
  -V ../TeslaLogger/GrafanaDB:/var/lib/grafana/ \
  -v ../TeslaLogger/GrafanaConfig/datasource.yaml:/etc/grafana/provisioning/datasources/datasource.yml \
  -v ../TeslaLogger/GrafanaConfig/sample.yaml:/etc/grafana/provisioning/dashboards/dashboards.yml \
  -e GF_SECURITY_ADMIN_PASSWORD=teslalogger \
  -e GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS=natel-discrete-panel,pr0ps-trackmap-panel,teslalogger-timeline-panel \
  -e TZ=Europe/Prague \
  -p 3000:3000 \
  grafana/grafana:10.0.1
