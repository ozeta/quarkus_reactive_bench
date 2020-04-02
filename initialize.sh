#!/bin/bash
set -euo pipefail

initialize_gatling() {
  echo "[INFO] installing gatling from maven repo"
  curl -sO https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/3.3.1/gatling-charts-highcharts-bundle-3.3.1-bundle.zip
  unzip -q gatling-charts-highcharts-bundle-3.3.1-bundle.zip
  rm gatling-charts-highcharts-bundle-3.3.1-bundle.zip
  rsync -aq gatling-charts-highcharts-bundle-3.3.1 gatling-bench
  rm gatling-charts-highcharts-bundle-3.3.1-bundle
}

initialize_env_vars() {
  echo "[INFO] reading env var from $1"
  set -a
  export "$(cat $1 | xargs)"
  set +a
}

[[ ! -d gatling-bench/bin ]] && initialize_gatling
[[ -d env ]] && initialize_env_vars env/local.env
