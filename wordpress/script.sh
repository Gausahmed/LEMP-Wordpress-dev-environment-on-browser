#!/bin/bash

# Check if docker-compose is installed
if ! [ -x "$(command -v docker-compose)" ]; then
  # Install docker-compose if not present
  echo "Installing Docker Compose..."
  apt-get update
  apt-get install -y docker-compose
fi

# Check if site name argument was provided
if [ -z "$1" ]; then
  echo "Please provide a site name as an argument."
  exit 1
fi
