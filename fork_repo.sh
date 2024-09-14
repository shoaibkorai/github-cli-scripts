#!/bin/bash

# Check if the repository name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 owner/repo-name"
  exit 1
fi

# Assign the first argument to REPO_NAME variable
REPO_NAME=$1

# Use gh CLI to fork the repository
gh repo fork "$REPO_NAME"

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Repository $REPO_NAME has been forked."
else
  echo "Failed to fork the repository. Please check the repository name and try again."
fi

