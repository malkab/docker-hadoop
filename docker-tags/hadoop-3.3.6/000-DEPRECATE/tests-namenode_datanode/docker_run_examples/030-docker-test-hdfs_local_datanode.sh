#!/bin/bash

# -----------------------------------------------------------------
#
# Runs a standalone DataNode.
#
# -----------------------------------------------------------------
docker run -ti --rm \
    --network host \
    -v ./data_datanode:/data_datanode \
    -v ./hadoop_logs_datanode:/hadoop/logs \
    -e HADOOP_HEAPSIZE_MAX=5g \
    -e HDFS_DATANODE_OPTS="-XX:+UseParallelGC -Xmx4g" \
    -e HDFS_SITE_DFS_NAMENODE_RPC_ADDRESS=helios:9022 \
    -e HDFS_SITE_DFS_DATANODE_HTTP_ADDRESS=0.0.0.0:8036 \
    malkab/hadoop:3.3.6 \
    -c "/run_datanode.sh"
