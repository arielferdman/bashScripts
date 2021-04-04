sudo dnf update
sudo dnf install httpd httpd-tools mod_ssl
sudo systemctl enable httpd
sudo systemctl start httpd
sudo dnf install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm
sudo dnf module reset php
sudo dnf module enable php:remi-7.3
sudo dnf update
sudo dnf install php php-fpm  php-gd php-mysqlnd
sudo systemctl enable php-fpm
sudo systemctl start php-fpm

read -r -d '' apache_file << EOM
apache_file="<VirtualHost *:80>
    ServerAdmin admin@example.com
    DocumentRoot /var/www/html
 
    ServerName example.com
    ServerAlias www.example.com
 
    # Proxy declaration
    <Proxy "unix:/run/php-fpm/www.sock|fcgi://php-fpm">
       # we must declare a parameter in here (doesn't matter which) or 
       # it'll not register the proxy ahead of time

       ProxySet disablereuse=off
 
       # Note: If you configure php-fpm to use the "pm = ondemand" 
       #then use "ProxySet disablereuse=on"
     </Proxy>
 
     <FilesMatch \.php$>
           SetHandler proxy:fcgi://php-fpm
     </FilesMatch>
 
    ErrorLog logs/example.com-error.log
    CustomLog logs/example.com-access.log combined
</VirtualHost>
EOM

echo $apache_file > /etc/httpd/conf.d/example.com.conf
sudo systemctl restart httpd




