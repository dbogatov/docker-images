FROM wichon/alpine-apache-php:latest

MAINTAINER Dmytro Bogatov dmytro@dbogatov.org

RUN \
	apk --update add bash && \
	\
    rm -rf /var/cache/apk/* && \
	\
	sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf && \
	sed -i 's/#LoadModule\ deflate_module/LoadModule\ deflate_module/' /etc/apache2/httpd.conf && \
	sed -i 's/#LoadModule\ expires_module/LoadModule\ expires_module/' /etc/apache2/httpd.conf && \
	\
	sed -i "s#^DocumentRoot \".*#DocumentRoot \"/app/$WEBAPP_ROOT\"#g" /etc/apache2/httpd.conf && \
	sed -i "s#/var/www/localhost/htdocs#/app/$WEBAPP_ROOT#" /etc/apache2/httpd.conf && \
	printf "\n<Directory \"/app/$WEBAPP_ROOT\">\n\tAllowOverride All\n</Directory>\n" >> /etc/apache2/httpd.conf

ENTRYPOINT httpd -D FOREGROUND
