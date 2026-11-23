#!/bin/bash

export GID=$(id -g)
docker exec -it \
           -e USER=${USER} \
           -e HOME=${HOME} \
           --user=${UID}:${GID} \
           pydev bash
