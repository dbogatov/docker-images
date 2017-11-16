FROM mhart/alpine-node
MAINTAINER Dmytro Bogatov

# Install Bash
RUN apk upgrade --update \
	&& apk add bash \
	&& rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
 	&& apk search --update

# Install gloabally Broken Link Checker tool and simple http server
RUN npm install -g broken-link-checker http-server
