#!/bin/bash
set  -euo pipefail

initialize_gatling () {
    echo "[INFO] installing gatling from maven repo"
    curl -O https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/3.3.1/gatling-charts-highcharts-bundle-3.3.1-bundle.zip
    unzip gatling-charts-highcharts-bundle-3.3.1-bundle.zip
    rm gatling-charts-highcharts-bundle-3.3.1-bundle.zip
}

[[ ! -d gatling-charts-highcharts-bundle-3.3.1/bin ]] && initialize_gatling;

