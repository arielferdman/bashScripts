container_id=$(docker ps | grep $1 | awk '{print $1}')
docker cp init-container.sh $container_id:/usr/bin
docker exec $container_id bash init-container.sh
docker exec -i -u 0 $container_id bash <<EOF
echo 'alias ll="ls -al"' >> /root/.bashrc
EOF
