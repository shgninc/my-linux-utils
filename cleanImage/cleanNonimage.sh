#!/bin/bash

docker images | grep none | awk '{print $3}' | while read line; do docker rmi $line; done
