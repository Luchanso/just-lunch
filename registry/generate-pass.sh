#!/bin/sh

mkdir -p auth

docker run \
  --entrypoint htpasswd \
  httpd:2 -Bbn $1 $2 > auth/htpasswd
