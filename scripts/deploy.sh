#!/bin/bash

echo "Pulling latest images..."
docker pull yourdockerusername/backend:staging
docker pull yourdockerusername/frontend:staging

echo "Stopping old containers..."
docker-compose down

echo "Starting new containers..."
docker-compose up -d

echo "Deployment completed"
