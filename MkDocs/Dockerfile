FROM mhart/alpine-node
MAINTAINER Dmytro Bogatov

RUN apk upgrade --update \
	&& \
		apk add py-pip bash nodejs doxygen git \
	&& pip install mkdocs \
	&& pip install pygments \
	&& pip install pymdown-extensions \
	&& pip install mkdocs-material \
	&& rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/*
