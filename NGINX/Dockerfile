FROM alpine:latest

MAINTAINER Dmytro Bogatov dmytro@dbogatov.org

RUN apk --update add nginx bash ca-certificates s6 curl ssmtp mysql \
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
	mkdir -p /run/php && \
	mkdir -p /run/mysqld

COPY default.conf /etc/nginx/conf.d/

COPY www.conf /etc/php7/php-fpm.d/

COPY run.sh /

# RUN echo "<html><body><h1>LOL</h1></body></html>" > /srv/index.html

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443

# Entry point
CMD ["/bin/bash", "-c", "/run.sh"] 
