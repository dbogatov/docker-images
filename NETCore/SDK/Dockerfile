FROM microsoft/dotnet:1.1-sdk-msbuild

# Add NodeJS repo
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

# Install NodeJS and Doxygen
RUN apt-get install -y nodejs doxygen

# Install gloabally Gulp task runner, Bower front-end manager and Broken Link Checker tool
RUN npm install -g gulp bower broken-link-checker

# Install HTML Tidy for W3C Validation
RUN wget http://binaries.html-tidy.org/binaries/tidy-5.2.0/tidy-5.2.0-64bit.deb && dpkg -i tidy-5.2.0-64bit.deb && rm tidy-5.2.0-64bit.deb