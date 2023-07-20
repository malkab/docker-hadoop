#!/bin/bash

# -----------------------------------------------------------------
#
# Runs an standalone NameNode.
#
# -----------------------------------------------------------------
docker run -ti --rm \
    --network host \
    -v ./data_namenode:/data_namenode \
    -v ./hadoop_logs:/hadoop/logs \
    -e HADOOP_HEAPSIZE_MAX=5g \
    -e HDFS_NAMENODE_OPTS="-XX:+UseParallelGC -Xmx4g" \
    -e HDFS_SITE_DFS_NAMENODE_RPC_ADDRESS=0.0.0.0:9022 \
    -e HDFS_SITE_DFS_NAMENODE_HTTP_ADDRESS=0.0.0.0:8035 \
    malkab/hadoop:3.3.6 \
    -c "/run_namenode.sh"
