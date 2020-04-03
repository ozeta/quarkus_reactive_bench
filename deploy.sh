initialize_env_vars() {
  echo "[INFO] reading env var from $1"
  set -a
  . $1
  set +a
}

[[ -d env ]] && initialize_env_vars ./env/local.env

docker stack deploy -c docker-compose.yml stack