#!/bin/bash

docker run -ti --rm \
    --hostname kepler \
    --network host \
    -v ./data_datanode:/data_datanode \
    -v ./hadoop_logs_datanode:/hadoop/logs \
    -e HADOOP_HEAPSIZE_MAX=5g \
    -e HDFS_DATANODE_OPTS="-XX:+UseParallelGC -Xmx4g" \
    -e HDFS_SITE_DFS_NAMENODE_RPC_ADDRESS=helios:9022 \
    -e HDFS_SITE_DFS_DATANODE_HTTP_ADDRESS=0.0.0.0:8046 \
    -e HDFS_SITE_DFS_DATANODE_ADDRESS=0.0.0.0:9879 \
    -e HDFS_SITE_DFS_DATANODE_IPC_ADDRESS=0.0.0.0:9999 \
    malkab/hadoop:3.3.6 \
    -c "/run_datanode.sh"
