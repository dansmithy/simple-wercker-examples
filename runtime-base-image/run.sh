#!/bin/bash

docker pull alpine

wercker build --artifacts && \
wercker deploy --pipeline build-image --docker-local
