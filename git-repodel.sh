#!/bin/bash

# Check if a repository name was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <repository-name>"
  exit 1
fi

REPO_NAME=$1

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
  echo "GitHub CLI (gh) could not be found. Please install it first."
  exit 1
fi

# Delete the repository on GitHub
gh repo delete $REPO_NAME --yes

echo "Repository $REPO_NAME deleted successfully."

