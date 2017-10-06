FROM alpine
MAINTAINER Dmytro Bogatov

# Install Bash, CURL, UNZIP and CA Certs
RUN apk upgrade --update \
	&& apk add bash unzip curl ca-certificates openssh sshpass \
	&& rm -rf /tmp/* /usr/share/man /var/cache/apk/* \
 	&& apk search --update
