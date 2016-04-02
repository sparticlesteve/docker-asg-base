#!/bin/bash

# You should have password-less authentication to checkout from svn.cern.ch
# in order to run this script.

set -e

# Setup environment
source scripts/config.sh

# Checkout the packages
./scripts/checkoutPackages.sh

# Pull the latest base image
sudo docker pull sfarrell/ubuntu-root:gcc49-root60412

echo "Building docker image..."
sudo docker build -t $DOCKER_TARGET_IMAGE .

imageID=`sudo docker images -q $DOCKER_TARGET_IMAGE:latest`
echo "Tagging $imageID as $DOCKER_TARGET_TAG..."
sudo docker tag $imageID $DOCKER_TARGET_IMAGE:$DOCKER_TARGET_TAG
