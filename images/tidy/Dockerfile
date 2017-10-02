FROM mhart/alpine-node
MAINTAINER Dmytro Bogatov

# Install Tidy HTML and Bash
RUN apk upgrade --update \
	&& apk add tidyhtml bash curl \
	&& rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
 	&& apk search --update

# Install gloabally simple http server
RUN npm install -g http-server
