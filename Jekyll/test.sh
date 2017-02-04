#!/bin/bash
set -e

# Script to test the image

jekyll --version
npm --version
gulp --version
bower --version
blc --version
tidy --version
bundle --version
http-server --help > /dev/null
