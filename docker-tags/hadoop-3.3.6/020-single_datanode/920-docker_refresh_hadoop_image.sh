#!/bin/bash

# -----------------------------------------------------------------
#
# Drops and pulls the Docker Hadoop image.
#
# -----------------------------------------------------------------
docker rmi malkab/hadoop:3.3.6
docker pull malkab/hadoop:3.3.6
