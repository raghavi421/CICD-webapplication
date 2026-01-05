#!/bin/bash

STATUS=$(curl -s http://localhost:5000/health | grep ok)

if [ -z "$STATUS" ]; then
  echo "Deployment failed"
  exit 1
else
  echo "Application is healthy"
fi
