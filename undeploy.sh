source ./ci/functions.sh
stack_name=stack
volume=${stack_name}_postgres
limit=10

function remove_stack () {
    docker stack rm $stack_name
    until [ -z "$(docker service ls --filter label=com.docker.stack.namespace=$stack_name -q)" ] || [ "$limit" -lt 0 ]; do
        sleep 1;
    done    
    until [ -z "$(docker network ls --filter label=com.docker.stack.namespace=$stack_name -q)" ] || [ "$limit" -lt 0 ]; do
    sleep 1;
    done
}

docker stack ls | grep $stack_name
[[ "$?" == 0 ]] && echo "[INFO] deleting volume <$volume>" && remove_stack

[[ "$1" == "--purge" ]] && echo "[INFO] deleting volume <$volume>" && docker volume rm $volume -f 