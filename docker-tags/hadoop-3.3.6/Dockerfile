FROM eclipse-temurin:11.0.19_7-jre-jammy AS build

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

WORKDIR /

USER 0:0

ADD assets/hadoop-3.3.6.tar.gz /
RUN mv /hadoop-3.3.6 /hadoop
RUN chown -R 0:0 /hadoop
RUN mkdir /hadoop_tmp

ADD assets/dot.bashrc /root/.bashrc
ADD assets/dot.bashrc /etc/skel/.bashrc
ADD assets/config.sh /

ADD assets/core-site.xml.template /hadoop/etc/hadoop/core-site.xml.template
ADD assets/hdfs-site.xml.template /hadoop/etc/hadoop/hdfs-site.xml.template

ADD assets/run_namenode.sh /
ADD assets/run_datanode.sh /
ADD assets/run_format_hdfs.sh /
RUN chmod 755 /*.sh

# Comment the following three lines for fast build in developing the image
RUN chmod 755 -R /usr/bin/ ; chmod 755 /config.sh ; /config.sh ; rm /config.sh
RUN chown -R 1000:1000 /hadoop_tmp
RUN chown -R 1000:1000 /hadoop

# # FROM scratch
# # COPY --from=build / /

ENV PATH=$PATH:/hadoop/bin:/hadoop/sbin

ENV JAVA_HOME=/opt/java/openjdk/
ENV HADOOP_HOME=/hadoop
ENV HADOOP_LOG_DIR=/hadoop/logs
ENV HADOOP_ROOT_LOGGER=WARN,DRFA
ENV HADOOP_HEAPSIZE_MAX=1G
ENV HDFS_NAMENODE_OPTS="-XX:+UseParallelGC -Xmx1g"

# Where the HDFS site will listen
ENV CORE_SITE_FS_DEFAULTFS=localhost:9000
ENV HDFS_SITE_DFS_NAMENODE_RPC_ADDRESS=0.0.0.0:9000

# The dashboard for the namenode
ENV HDFS_SITE_DFS_NAMENODE_HTTP_ADDRESS=0.0.0.0:8020

# Datanode dashboard
ENV HDFS_SITE_DFS_DATANODE_HTTP_ADDRESS=0.0.0.0:8030

# Datanode address
ENV HDFS_SITE_DFS_DATANODE_ADDRESS=0.0.0.0:9878

# This is the interprocess communication address
ENV HDFS_SITE_DFS_DATANODE_IPC_ADDRESS=0.0.0.0:9899

ENTRYPOINT [ "/bin/bash" ]
