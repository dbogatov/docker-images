FROM alpine:latest

MAINTAINER Dmytro Bogatov dmytro@dbogatov.org

# Install all packages and clear cache
# Create directories for PID and sockets
RUN apk --update add nginx bash ca-certificates s6 curl ssmtp \
	\
	php7 php7-phar php7-curl php7-fpm php7-json php7-zlib php7-xml php7-dom \
	php7-ctype php7-opcache php7-zip php7-iconv php7-pdo php7-pdo_mysql \
	php7-pdo_sqlite php7-pdo_pgsql php7-mbstring php7-session php7-gd \
	php7-mcrypt php7-openssl php7-sockets php7-posix php7-ldap && \
	\
    rm -rf /var/cache/apk/* && \
	\
    ln -s /usr/bin/php7 /usr/bin/php && \
	\
	mkdir -p /run/nginx && \
	mkdir -p /run/php

# Copy PHP config. Use socket, not port
COPY www.conf /etc/php7/php-fpm.d/

# Copy startup script
COPY run.sh /

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443
