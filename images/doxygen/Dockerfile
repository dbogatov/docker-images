FROM dbogatov/docker-sources:alpine

# Install Doxygen
RUN apk upgrade --update \
	&& apk add bash doxygen \
	&& rm -rf /tmp/* /usr/share/man /var/cache/apk/* \
 	&& apk search --update
