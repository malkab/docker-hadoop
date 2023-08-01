#!/bin/bash

docker compose \
    -f docker-compose.yaml \
    rm -f

docker volume rm \
    hadoop_datanode \
    hadoop_datanode_logs \
    hadoop_namenode \
    hadoop_namenode_logs
