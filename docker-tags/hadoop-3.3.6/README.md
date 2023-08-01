# Docker Image for Hadoop 3.3.6

A Docker image to deploy simple Hadoop 3.3.6 clusters.

Please note that this Docker images are designed for a very, very simple use case. No YARN is used. Only HDFS to support Spark. It has not been tested in other use cases, but a full installation of Hadoop is used, so theoretically this image should be adapted to any Hadoop use case.

Also, this image has not been tested to work in **SWARM mode**, since encapsulation of ports and other features makes this difficult. It is designed to run as a **Compose** that attachs to the **host network** directly.

This image includes:

- Hadoop 3.3.6, binaries, downloaded from the official site;
- JRE 11.0.19_7, inherited from the Eclipse-Temurin official images;
- some utilities to have a decent Bash environment to use as CLI client.

This image can double to run both **NameNodes** and **DataNodes**.


## Building & Pushing

Just run **010** and **020**.


## Configuring the Containers with Env Vars

Both **NameNodes** and **DataNodes** can be configured. Check the **Dockerfile** and the example **docker-compose.yaml** in 010 and 020 for examples.


## Folders

Some example deployments are provided:

- **010-namenode_datanode:** a Compose running a NameNode and a DataNode in the same host.

- **020-single_datanode:** a Compose to run a single DataNode in a machine that connects to a NameNode in another host.

- **030-cli:** a CLI to work with HDFS commands, plus a sample script that uploads data to the cluster.
