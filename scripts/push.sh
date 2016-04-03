#!/bin/bash

# Config variables
source scripts/config.sh

# Push our image to docker-hub
echo "Pushing $DOCKER_TARGET_IMAGE to docker-hub"
sudo docker push $DOCKER_TARGET_IMAGE
