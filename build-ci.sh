#!/bin/bash
set -e

FILENAME=".gitlab-ci.yml"

#
# 1 - shortname
# 2 - variable name
# 3 - directory
#
build-build-block () {

	cat >> $FILENAME <<BBB
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

	cat >> $FILENAME <<BTB
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

	cat >> $FILENAME <<BRB
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

	cat >> $FILENAME <<BIB

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

		cat >> $FILENAME <<BVT
  $2_TEST: \$IMAGE:$1-\$CI_BUILD_REF_NAME
  $2_RELEASE: \$IMAGE:$1-latest

BVT

}

build-variables () {

	cat >> $FILENAME <<BV
variables:

  IMAGE: dbogatov/docker-containers

BV

}

build-preamble () {

	touch $FILENAME

		cat > $FILENAME <<BP
### THIS FILE IS GENERATED AUTOMATICALLY
### DO NOT MODIFY IT DIRECTLY
### USE ./build-ci.sh INSTEAD

stages:
  - build
  - test
  - release

before_script:
  - docker login -u \$DOCKER_USER -p \$DOCKER_PASS

BP

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
		DIRECTORY=${IMAGES[i]%/}

		$1  $SHORT $VARIABLE $DIRECTORY
		
	done

}

## BUILD CI FILE

build-preamble

build-variables

cd images
IMAGES=(*/)
cd ..

run-loop build-variable-tuple
run-loop build-image-blocks

echo "Done."
