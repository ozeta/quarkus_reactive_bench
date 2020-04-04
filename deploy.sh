set -euo pipefail

source ./ci/functions.sh

initialize_env_vars() {
  echo "[INFO] reading env var from $1"
  set -o allexport
  source $1
  set +o allexport
}

[[ -d env ]] && initialize_env_vars ./env/local.env

echo "[INFO]: $POSTGRES_USER"
echo "[INFO]: $POSTGRES_PASSWORD"
[[ -z $POSTGRES_USER ]] && echo "[ERROR] unable to read env vars" && exit 1

docker stack deploy -c docker-compose.yml stack
#progress 10
docker service ls