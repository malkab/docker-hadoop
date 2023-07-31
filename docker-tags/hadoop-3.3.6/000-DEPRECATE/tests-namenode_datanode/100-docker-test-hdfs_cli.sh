#!/bin/bash

docker run -ti --rm \
    --network host \
    -v $(pwd):$(pwd) \
    --workdir $(pwd)/test_scripts \
    malkab/hadoop:3.3.6
