#!/bin/bash

docker run -it --name=teslalogger_grafana \
  -v $(pwd)/../TeslaLogger/bin:/etc/teslalogger \
  -v $(pwd)/../TeslaLogger/GrafanaDashboards/:/var/lib/grafana/dashboards/ \
  -v $(pwd)/../TeslaLogger/GrafanaPlugins/:/var/lib/grafana/plugins \
  -v $(pwd)/../TeslaLogger/GrafanaDB:/var/lib/grafana/ \
  -v $(pwd)/../TeslaLogger/GrafanaConfig/datasource.yaml:/etc/grafana/provisioning/datasources/datasource.yml \
  -v $(pwd)/../TeslaLogger/GrafanaConfig/sample.yaml:/etc/grafana/provisioning/dashboards/dashboards.yml \
  -e GF_SECURITY_ADMIN_PASSWORD=teslalogger \
  -e GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS=natel-discrete-panel,pr0ps-trackmap-panel,teslalogger-timeline-panel \
  -e TZ=Europe/Prague \
  -p 3000:3000 \
  grafana/grafana:10.0.1
