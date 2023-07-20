#!/bin/bash

docker compose \
    -f docker-compose-single_datanode.yaml \
    rm -f

docker volume rm \
    hadoop_datanode \
    hadoop_datanode_logs
