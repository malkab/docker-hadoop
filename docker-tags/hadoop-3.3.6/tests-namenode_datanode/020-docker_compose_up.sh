#!/bin/bash

docker compose \
    -f docker-compose/docker-compose-namenode_datanode.yaml \
    up
