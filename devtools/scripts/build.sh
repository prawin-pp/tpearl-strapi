#!/bin/bash

set -e

docker build --build-arg NODE_ENV=production -t registry.gitlab.com/tpearl/tpearl-strapi -f ./devtools/docker/Dockerfile .

docker push registry.gitlab.com/tpearl/tpearl-strapi
