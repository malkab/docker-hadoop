# Docker Image for Hadoop 3.3.6

A Docker image to deploy simple Hadoop 3.3.6 clusters.

Please note that this Docker images are designed for a very, very simple use case. No YARN is used. Only HDFS to support Spark. It has not been tested in other use cases, but a full installation of Hadoop is used, so theoretically this image should be adapted to any Hadoop use case.

This image includes:

- Hadoop 3.3.6, binaries, downloaded from the official site;
- JRE 11.0.19_7, inherited from the Eclipse-Temurin official images;
- some utilities to have a decent Bash environment to use as CLI client.

This image can double to run both **NameNodes** and **DataNodes**.

This image is intended to be run in Docker Compose mode in **host network mode**. No attempts to make it work in **SWARM** mode has been made.


## Building & Pushing

Just run **010** and **020**.


## Configuring the Containers with Env Vars

Both **NameNodes** and **DataNodes** can be configured. Some additional env vars, rarely used, can be found in the **Dockerfile**.


### Common Configs

So far:

- **HADOOP_HEAPSIZE_MAX:** max Hadoop heap size, defaults to **1G**. Possible values are 5G, etc.
- **HADOOP_ROOT_LOGGER:** logging setting. Defaults to **WARN,DRFA** to log files to **/hadoop/logs**. Other values can be for example INFO,DRFA, or INFO,console to log to console (debugging).


### NameNode

Env vars that configure a NameNode:

- **HDFS_NAMENODE_OPTS:** options to run the NameNode, as in **-XX:+UseParallelGC -Xmx4g**, for example.
- **HDFS_SITE_DFS_NAMENODE_HTTP_ADDRESS:** the address where the dashboard of the NameNode will be available. Defaults to **0.0.0.0:8022**, allowing access to all hosts at por 8022.
- **HDFS_SITE_DFS_NAMENODE_RPC_ADDRESS:** the address where the RPC of the NameNode will listen. It defaults to **0.0.0.0:9002**, allowing all hosts to connect to the NameNode at port 9002.


### DataNode

Env vars that configure the DataNode:

- **HDFS_DATANODE_OPTS:** like in the NameNode.
- **HDFS_SITE_DFS_NAMENODE_RPC_ADDRESS:** direction of the NameNode to connect to, for example **helios:9002**.
- **HDFS_SITE_DFS_DATANODE_HTTP_ADDRESS:** where the DataNode web administration will be available, defaults to **0.0.0.0:8032**.


## Docker Compose

Check the Composes for a **NameNode + DataNode** and a **single DataNode** provided as a guide.


## NameNode Set Up

After configuring the **NameNode** Compose and formatter script **010**:

- run **010**, it will create the NameNode data volume and format it;
- run **020** to run the **NameNode + DataNode** compose. This is the most compact deployment possible, in a single host. Additional DataNode can be created on other hosts.

Test the cluster by running the script in **test_scripts** with the **100** HDFS CLI container.

Check volumes with **110**.

Drop everything with **CAUTION-DATA_LOSS**.


















Esto es un experimento para ver si podemos sacar adelante un Hadoop para usar el HDFS sobre SPARK.

Crear la imagen con 010.

Primero hay que arrancar sin namenode para formatear el NameNode:

    - arrancar en línea de comando

    - ejecutar /hadoop/bin/hdfs namenode -format

Arrancar un container con 015, arrancar un namenode con **/hadoop/bin/hdfs namenode**.

Estamos ajustando el **hdfs-site.xml**.

En **http://localhost:8020** está el overview del Namenode.

Volver a arrancar otro contenedor con 015 y probar el script de prueba **hdfs.sh**.

El NAMENODE también acumula datos. Se puede interaccionar con él con el cliente **/hadoop/bin/hdfs en hdfs://helios:9000/.

Arrancar en otra ventana otro contenedor con 015 con **/hadoop/bin/hdfs datanode**.

Este Data Node aparecerá en http://helios:8030.

No tiene sentido montar dos nodos en el mismo host.
