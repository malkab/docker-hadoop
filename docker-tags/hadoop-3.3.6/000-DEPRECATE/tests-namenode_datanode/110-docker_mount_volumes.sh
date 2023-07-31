#!/bin/bash

docker run -ti --rm \
    -v hadoop_namenode:/namenode_data \
    -v hadoop_namenode_logs:/namenode_logs \
    -v hadoop_datanode:/datanode_data \
    -v hadoop_datanode_logs:/datanode_logs \
    malkab/ubuntu-general-purpose
