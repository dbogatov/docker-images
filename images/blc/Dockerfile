FROM dbogatov/docker-sources:node-8.9.1-alpine
MAINTAINER Dmytro Bogatov

# Install Bash
RUN apk upgrade --update \
	&& apk add bash \
	&& rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
 	&& apk search --update

# Install gloabally Broken Link Checker tool and simple http server
RUN npm install -g broken-link-checker@0.7.3 http-server
