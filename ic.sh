container_id=$(docker ps | grep $1 | awk '{print $1}')
docker cp init-container.sh $container_id:/usr/bin
docker exec $container_id bash init-container.sh
