FROM mhart/alpine-node
MAINTAINER Dmytro Bogatov

# Install Bash
RUN apk upgrade --update \
	&& apk add bash git \
	&& rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
 	&& apk search --update

# Install gloabally CSpell
RUN npm install -g cspell
