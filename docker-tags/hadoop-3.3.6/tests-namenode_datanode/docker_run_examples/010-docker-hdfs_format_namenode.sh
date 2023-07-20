#!/bin/bash

# -----------------------------------------------------------------
#
# Formats the NameNode, creating it's local folder volume.
#
# -----------------------------------------------------------------
docker run -ti --rm \
    --network host \
    -v ./data_namenode:/data_namenode \
    malkab/hadoop:3.3.6 \
    -c "/hadoop/bin/hdfs namenode -format"
