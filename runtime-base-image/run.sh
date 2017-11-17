#!/bin/bash

wercker build --artifacts && \
wercker deploy --docker-local --pipeline build-image
