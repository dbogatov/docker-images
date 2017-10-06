#!/bin/bash
set -e

# Script to test the image

unzip -hh
curl --version
bash --version
which ssh
which scp
sshpass -V
