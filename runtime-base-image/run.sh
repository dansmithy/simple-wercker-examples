#!/bin/bash

wercker build --artifacts && \
wercker deploy --pipeline build-image --docker-local
