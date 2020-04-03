#!/bin/bash
set -euo pipefail
GATLING_BUNDLE="gatling-charts-highcharts-bundle-3.3.1"
REPO_URL="https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/3.3.1"
MD5="2a75f07457a7d505e450a3f5f36e65a0"

initialize_gatling() {
  echo "[INFO] installing gatling from maven repo"
  [[ ! -f "${GATLING_BUNDLE}-bundle.zip" ]] && curl -O "${REPO_URL}/${GATLING_BUNDLE}-bundle.zip" && unzip -q ${GATLING_BUNDLE}-bundle.zip
  dmd5=$(md5sum ${GATLING_BUNDLE}-bundle.zip | awk '{print $1}')
  [[ "$dmd5" != "$MD5" ]] && echo "[ERROR] MD5 check failed for $origin"

  mkdir -p ${GATLING_BUNDLE}/user-files/simulations/quarkus-bench/
  mv gatling-bench/user-files/simulations/quarkus-bench/quarkus-simulation.scala ${GATLING_BUNDLE}/user-files/simulations/quarkus-bench/
  rm -rf gatling-bench
  mv ${GATLING_BUNDLE} gatling-bench
  rm ${GATLING_BUNDLE}-bundle.zip
}

[[ ! -d gatling-bench/bin ]] && initialize_gatling

echo "Postgres user:${POSTGRES_USER}"