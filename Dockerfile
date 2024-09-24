FROM wordpress:latest

MAINTAINER phires <phil@2kd.de>

RUN set -ex; \ 
	apt-get update; \ 
	apt-get install -y libgmp-dev; \
	docker-php-ext-install -j "$(nproc)" gmp;

RUN pecl install redis \
	&& rm -rf /tmp/pear \
	&& docker-php-ext-enable redis
