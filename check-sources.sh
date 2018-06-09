#!/usr/bin/env bash
set -e

shopt -s globstar

# Ensure that the CWD is set to script's location
cd "${0%/*}"
CWD=$(pwd)

cd images
IMAGES=(*/)
cd ..

for ((i=0;i<${#IMAGES[@]};i++))
do
	DIR=${IMAGES[i]%/}

	echo "Checking $DIR..."

	grep -q "FROM dbogatov/docker-sources:" ./images/$DIR/Dockerfile
done

echo "Passed!"
