#!/bin/bash

#HDFS_ROOT=hdfs://helios:9022
HDFS_ROOT=hdfs://kepler:9000

/hadoop/bin/hdfs dfs -mkdir $HDFS_ROOT/user
/hadoop/bin/hdfs dfs -rm -r $HDFS_ROOT/user/test_data_to_put
/hadoop/bin/hdfs dfs -touch $HDFS_ROOT/user/abc
/hadoop/bin/hdfs dfs -put test_data_to_put $HDFS_ROOT/user
/hadoop/bin/hdfs dfs -ls $HDFS_ROOT/user
/hadoop/bin/hdfs dfs -ls $HDFS_ROOT/user/test_data_to_put
