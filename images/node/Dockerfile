FROM dbogatov/docker-sources:node-8.9.1-alpine
MAINTAINER Dmytro Bogatov

# Install Bash
RUN apk upgrade --update \
	&& apk add bash \
	&& rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
 	&& apk search --update

# Install gloabally http-server
RUN npm install -g http-server
