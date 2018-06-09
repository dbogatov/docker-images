FROM dbogatov/docker-sources:microsoft-dotnet-2.1-sdk

# Add NodeJS repo
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Install NodeJS and Doxygen
RUN apt-get install -y nodejs doxygen

# Install gloabally Gulp task runner, Bower front-end manager and Broken Link Checker tool
RUN npm install -g gulp bower broken-link-checker@0.7.3

# Install HTML Tidy for W3C Validation
RUN wget https://github.com/htacg/tidy-html5/releases/download/5.4.0/tidy-5.4.0-64bit.deb && dpkg -i tidy-5.4.0-64bit.deb && rm tidy-5.4.0-64bit.deb

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
	apt-get update && apt-get install yarn
