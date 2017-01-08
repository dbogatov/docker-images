FROM microsoft/dotnet:1.1-sdk-msbuild

RUN apt-get update
RUN apt-get install -y nodejs npm
RUN npm install -g gulp bower

RUN ln -s /usr/bin/nodejs /usr/bin/node
