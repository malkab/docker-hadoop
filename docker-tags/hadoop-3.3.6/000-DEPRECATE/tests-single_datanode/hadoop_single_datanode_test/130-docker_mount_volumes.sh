#!/bin/bash

docker run -ti --rm \
    -v hadoop_datanode:/datanode_data \
    -v hadoop_datanode_logs:/datanode_logs \
    malkab/ubuntu-general-purpose
