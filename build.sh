#!/usr/bin/env bash
set -e

shopt -s globstar

# Ensure that the CWD is set to script's location
cd "${0%/*}"
CWD=$(pwd)

CI=".gitlab-ci.yml"
README="README.md"

#
# 1 - shortname
# 2 - variable name
# 3 - directory
#
build-build-block () {

	cat >> $CI <<BBB
$1-build:
  stage: build
  script:
    - docker build --pull -t \$$2_TEST images/$3
    - docker push \$$2_TEST
  tags:
    - shell

BBB

}

#
# 1 - shortname
# 2 - variable name
# 3 - directory
#
build-test-block () {

	cat >> $CI <<BTB
$1-test:
  stage: test
  script:
    - docker pull \$$2_TEST
    - docker run -v \$CI_PROJECT_DIR/images/$3/test.sh:/test.sh --entrypoint="/bin/bash" \$$2_TEST /test.sh
  tags:
    - shell

BTB

}

#
# 1 - shortname
# 2 - variable name
#
build-release-block () {

	cat >> $CI <<BRB
$1-release:
  stage: release
  script:
    - docker pull \$$2_TEST
    - docker tag \$$2_TEST \$$2_RELEASE
    - docker push \$$2_RELEASE
  only:
    - master
  tags:
    - shell

BRB

}

#
# 1 - shortname
# 2 - variable name
# 3 - directory
#
build-image-blocks () {

	cat >> $CI <<BIB

### $( echo ${1} | awk '{print toupper($0)}' )

BIB

	build-build-block $1 $2 $3

	build-test-block $1 $2 $3

	build-release-block $1 $2 $3

}

#
# 1 - shortname
# 2 - variable name
#
build-variable-tuple () {

	cat >> $CI <<BVT
  $2_TEST: \$IMAGE:$1-\$CI_BUILD_REF_NAME
  $2_RELEASE: \$IMAGE:$1-latest

BVT

}

build-variables () {

	cat >> $CI <<BV
variables:

  IMAGE: dbogatov/docker-images

BV

}

build-preamble () {

	touch $CI

	cat > $CI <<BP
### THIS FILE IS GENERATED AUTOMATICALLY
### DO NOT MODIFY IT DIRECTLY
### USE ./build-ci.sh INSTEAD

stages:
  - lint
  - build
  - test
  - release

before_script:
  - docker login -u \$DOCKER_USER -p \$DOCKER_PASS

BP

}

#
# 1 - file
# 2 - short description
#
build-lint () {

	FILE=$1
	SHORT=$2

	cat >> $CI <<BL
### LINT $SHORT

check-$SHORT-file:
  before_script: []
  stage: lint
  image: dbogatov/docker-images:alpine-extras-latest
  script:
    - mv $FILE actual
    - ./build.sh
    - diff -q actual $FILE
  tags:
    - docker

BL

}

build-sources-check () {

	cat >> $CI <<BSC
### LINT sources check

check-sources:
  before_script: []
  stage: lint
  image: dbogatov/docker-images:alpine-extras-latest
  script:
    - ./check-sources.sh
  tags:
    - docker

BSC

}


#
# 1 - command
# 2 - purpose
#
run-loop () {

	for ((i=0;i<${#IMAGES[@]};i++))
	do
		echo "Building ${IMAGES[i]%/} $2..."

		SHORT=${IMAGES[i]%/}
		VARIABLE=$( echo ${IMAGES[i]%/} | awk '{print toupper($0)}' | tr -s '-' | tr '-' '_' )

		$1 $SHORT $VARIABLE $SHORT
		
	done

}

generate-readme () {

	printf "\n\n##" >> $README
	cat "./images/$1/README.md" >> $README

}

## BUILD CI FILE

build-preamble

build-variables

cd images
IMAGES=(*/)
cd ..

run-loop build-variable-tuple

build-lint $CI "ci"
build-lint $README "readme"

build-sources-check

run-loop build-image-blocks

## GENERATE README

touch $README

cat README-preamble.md > $README

run-loop generate-readme

echo "Done."
