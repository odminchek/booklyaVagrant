include common/upstream;
include common/ssl;
include common/security;

server {
	listen 80;
	listen 8080;
	listen 443 ssl;
	
	server_name laravel.l;	

	root /var/www/laravel/blog/public;

	index index.php index.html index.htm;

	client_max_body_size	200m;

	fastcgi_buffers 64 4K;
	
	include common/cache;

	location / {
		include common/php-fpm;
		index index.php index.html index.htm;
		try_files $uri $uri/ /index.php?$query_string;
	}
}
