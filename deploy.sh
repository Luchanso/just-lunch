#!/bin/sh
set -e

# Read environment variables
source .deploy.env

# SSH into server and run commands
ssh -t $DEPLOY_USER@$DEPLOY_SERVER_IP "
  cd $DEPLOY_APP_DIR &&
  docker compose pull &&
  docker compose up -d --force
"
