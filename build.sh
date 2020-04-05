
#!/bin/bash
set -euo pipefail

cd quarkus-bench/
mvn clean package
docker build -f src/main/docker/Dockerfile.jvm -t quarkus/quarkus-bench-jvm .