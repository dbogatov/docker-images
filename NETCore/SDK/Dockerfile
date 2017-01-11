FROM microsoft/dotnet:1.1-sdk-msbuild

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs doxygen

RUN npm install -g gulp bower broken-link-checker

RUN wget http://binaries.html-tidy.org/binaries/tidy-5.2.0/tidy-5.2.0-64bit.deb && dpkg -i tidy-5.2.0-64bit.deb && rm tidy-5.2.0-64bit.deb
