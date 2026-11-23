#!/bin/bash

docker compose run --rm -e REAL_HOST=${HOSTNAME} --name pydev pydev

