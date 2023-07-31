#!/bin/bash

# -----------------------------------------------------------------
#
# Runs a Hadoop NameNode.
#
# -----------------------------------------------------------------

# Rewrite CORE configuration
cp /hadoop/etc/hadoop/core-site.xml.template /hadoop/etc/hadoop/core-site.xml

sed -i "s/CORE_SITE_FS_DEFAULTFS/${CORE_SITE_FS_DEFAULTFS}/g" /hadoop/etc/hadoop/core-site.xml


# Rewrite HDFS configuration
cp /hadoop/etc/hadoop/hdfs-site.xml.template /hadoop/etc/hadoop/hdfs-site.xml

sed -i "s/HDFS_SITE_DFS_NAMENODE_RPC_ADDRESS/${HDFS_SITE_DFS_NAMENODE_RPC_ADDRESS}/g" /hadoop/etc/hadoop/hdfs-site.xml
sed -i "s/HDFS_SITE_DFS_NAMENODE_HTTP_ADDRESS/${HDFS_SITE_DFS_NAMENODE_HTTP_ADDRESS}/g" /hadoop/etc/hadoop/hdfs-site.xml
sed -i "s/HDFS_SITE_DFS_DATANODE_HTTP_ADDRESS/${HDFS_SITE_DFS_DATANODE_HTTP_ADDRESS}/g" /hadoop/etc/hadoop/hdfs-site.xml
sed -i "s/HDFS_SITE_DFS_DATANODE_ADDRESS/${HDFS_SITE_DFS_DATANODE_ADDRESS}/g" /hadoop/etc/hadoop/hdfs-site.xml
sed -i "s/HDFS_SITE_DFS_DATANODE_IPC_ADDRESS/${HDFS_SITE_DFS_DATANODE_IPC_ADDRESS}/g" /hadoop/etc/hadoop/hdfs-site.xml


# Run
/hadoop/bin/hdfs namenode -format
