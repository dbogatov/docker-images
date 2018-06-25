# Docker Containers

This repo is a home for the images I use in my own build system.

## Structure

Each image has its folder.
In that folder there are:

* `README.md` which iterates what's inside the container.
* `test.sh` which contains simple "tests" for the container.
* `Dockerfile` used to build the container.
* Optionally some other files which get copied into the image

## CI

The generation of the images is automatic.
GitLab CI (as defined in `.gitlab-ci.yml`) is responsible for building,
testing and releasing (publishing) images to 
[my repo](https://hub.docker.com/r/dbogatov/docker-containers/) in docker hub.

An image does not get released unless it passes its tests.

## Tests

Tests are ridiculously simple. Bash script verifies that each executable is in 
place by asking for version (`blc --version`) or checking config validity
(`nginx -t`).

## Images


### Alpine with Extras

In this image:

* Alpine (latest)
* curl (latest)
* bash (latest)
* unzip (latest)
* ca-certificates (latest)
* openssh (latest)
* sshpass (latest)
* build-base (latest)
	* make
	* gcc / g++
	* libc-dev


### Broken Links Checker

In this image:
* NodeJS v7
* Broken Link Checker (0.7.3)
* Bash
* http server (NPM)


### CSpell

In this image:
* NodeJS / NPM
* Bash
* CSpell (latest)
* Git


### Debian + Tools for packaging

In this image:
* Debuild
* Build essentials
* Lintian


### Doxygen

In this image:
* Doxygen (latest)
* bash (latest)


### Gulp + Bower

In this image:
* NodeJS / NPM
* Gulp (latest)
* Bash
* Bower (latest)
* Git


### Jekyll + Dev dependencies

In this image:
* Ruby
* NodeJS v7
* Gulp (latest on NPM)
* Bower (latest on NPM)
* Bash


### Latex with Fira Sans font

In this image:
* Latex distribution from tianon
* Fira Sans form [carrois/Fira](https://github.com/carrois/Fira)


### MkDocs + Material Theme with extensions

In this image:
* PIP
* Python
* MkDocs
* Material theme + extensions


### .NET Core SDK 1.1 + Dev dependencies

In this image:
* .NET Core SDK 1.1 with MSBuild (not `project.json`)
* NodeJS v8
* Doxygen (latest on apt-get repos)
* Gulp (latest on NPM)
* Bower (latest on NPM)
* Broken Link Checker (0.7.3)
* HTML Tidy 5.2.0
* Yarn


### .NET Core SDK + Dev dependencies

In this image:
* .NET Core SDK 2.0.3 with MSBuild (not `project.json`)
* NodeJS v8
* Doxygen (latest on apt-get repos)
* Gulp (latest on NPM)
* Bower (latest on NPM)
* Broken Link Checker (0.7.3)
* HTML Tidy 5.2.0
* Yarn


### NGINX + Alpine + PHP 7

In this image:
* NGINX (recent version)
* PHP 7 + FPM


### Node

In this image:
* NodeJS v8
* Bash
* http-server


### PHP 5

In this image:

* PHP 5


### Tidy

In this image:
* NodeJS v7
* HTML Tidy 5.2.0
* Bash
* http-server (NPM)
