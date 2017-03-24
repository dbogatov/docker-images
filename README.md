# Docker Containers

This repo is a home for the images I use in my own build system.

## Structure

Each image has its folder.
In that folder there are:

* `README.md` which iterates what's inside the container.
* `test.sh` which contains simple "tests" for the continer.
* `Dockerfile` used to build the container.
* Optionally some other files which get copied into the image

## CI

The generation of the images is automatic.
GitLab CI (as defined in `.gitlab-ci.yml`) is responsible for building,
testing and releasing (publishing) images to 
[my repo](https://hub.docker.com/r/dbogatov/docker-containers/) in docker hub.

An image does not get released unless it passes its tests.

## Tests

Tests are ridiculuosly simple. Bash script verifies that each executable is in 
place by asking for version (`blc --version`) or checking config validity
(`nginx -t`).
