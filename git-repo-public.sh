#!/bin/bash

# Check if the repository name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 username/repo-name"
  exit 1
fi

# Assign the first argument to REPO_NAME variable
REPO_NAME=$1

# Use gh CLI to make the repository public
gh repo edit "$REPO_NAME" --visibility public

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Repository $REPO_NAME is now public."
else
  echo "Failed to make the repository public. Please check the repository name and try again."
fi

