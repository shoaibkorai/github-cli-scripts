#!/bin/bash

# Check if the user provided a repository name
if [ -z "$1" ]; then
  echo "Usage: $0 <repository-name>"
  exit 1
fi

# Store the repository name
repo_name=$1

# Use GitHub CLI to view the repository details
gh repo view "$repo_name"

