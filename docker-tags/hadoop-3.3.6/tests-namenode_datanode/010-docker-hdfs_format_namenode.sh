#!/bin/bash

# -----------------------------------------------------------------
#
# Creates the NameNode data volume and formats it.
#
# Volume in line 12 must be the same as in the docker-compose configuring
# the NameNode.
#
# -----------------------------------------------------------------
docker run -ti --rm \
    -v hadoop_namenode:/data_namenode \
    malkab/hadoop:3.3.6 \
    -c "/hadoop/bin/hdfs namenode -format"
