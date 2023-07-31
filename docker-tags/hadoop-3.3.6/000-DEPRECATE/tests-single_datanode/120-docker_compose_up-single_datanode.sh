#!/bin/bash

docker compose \
    -f hadoop_single_datanode_test/docker-compose-single_datanode.yaml \
    up
