#!/usr/bin/env bash
set -e

shopt -s globstar

# Ensure that the CWD is set to script's location
cd "${0%/*}"
CWD=$(pwd)

usage () {
    printf "usage: ./$0 <from> <to>\n"
    printf "where\n"
    printf "\t from - full path to source image\n"
    printf "\t ro - tag of the image in mirror repo\n"
    
    exit 1;
}

if ! [ $# -eq 2 ]
then
    usage
fi

FROM=$1
TO=$2

docker pull $FROM
docker tag $FROM dbogatov/docker-sources:$TO
docker push dbogatov/docker-sources:$TO

echo "Done."
