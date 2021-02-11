docker run --name wp -p 9456:80 -e WORDPRESS_DB_HOST=172.17.0.2:3306 \
    -e 	WORDPRESS_DB_NAME=wordpress -e WORDPRESS_DB_USER=ariel -e WORDPRESS_DB_PASSWORD=sana1984 -d wordpress
