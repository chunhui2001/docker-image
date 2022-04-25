#!/bin/bash

docker-compose -f 1/docker-compose.yml up -d
docker-compose -f 2/docker-compose.yml up -d
docker-compose -f 3/docker-compose.yml up -d