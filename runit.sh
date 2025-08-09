#!/bin/bash

export UID
export GID=`id -g`
export PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native
docker compose run --rm -e REAL_HOST=${HOSTNAME} --name pydev pydev
