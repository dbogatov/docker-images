FROM dbogatov/docker-sources:library-alpine

MAINTAINER Dmytro Bogatov dmytro@dbogatov.org

# Install all packages and clear cache
# Create directories for PID and sockets
RUN apk --update add nginx bash ca-certificates s6 curl ssmtp \
	\
    rm -rf /var/cache/apk/* && \
	\
	mkdir -p /run/nginx && \
	\
	rm /etc/nginx/conf.d/*

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443
