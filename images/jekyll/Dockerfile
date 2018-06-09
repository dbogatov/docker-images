FROM dbogatov/docker-sources:mhart-alpine-node
MAINTAINER Dmytro Bogatov

RUN apk upgrade --update \
	&& \
		apk add libatomic readline readline-dev libxml2 libxml2-dev \
		ncurses-terminfo-base ncurses-terminfo \
		libxslt libxslt-dev zlib-dev zlib \
		ruby ruby-dev yaml yaml-dev ruby-dev \
		libffi-dev build-base git nodejs curl \
		ruby-io-console ruby-irb ruby-json ruby-rake bash \
	&& gem install --no-document redcarpet kramdown maruku rdiscount RedCloth liquid pygments.rb \
	&& gem install --no-document sass safe_yaml \        
	&& gem install --no-document jekyll \
	&& gem install --no-document jekyll-paginate jekyll-sass-converter \
	&& gem install --no-document jekyll-sitemap jekyll-feed jekyll-redirect-from \
	&& gem install --no-document bundle \
	&& gem install --no-document nokogiri \
	&& rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
 	&& apk search --update

# Install gloabally Gulp task runner, Bower front-end manager
RUN npm install -g gulp bower
