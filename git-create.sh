#!/bin/bash

# Check if a repository name was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <repository-name> [--private]"
  exit 1
fi

REPO_NAME=$1
PRIVATE_FLAG=$2

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
  echo "GitHub CLI (gh) could not be found. Please install it first."
  exit 1
fi

# Initialize a local Git repository
git init $REPO_NAME
cd $REPO_NAME

# Create a new repository on GitHub
if [ "$PRIVATE_FLAG" == "--private" ]; then
  gh repo create $REPO_NAME --private
else
  gh repo create $REPO_NAME --public
fi

# Get SSH URL of the repository
#REPO_URL=$(gh repo view $REPO_NAME --json ssh_url --jq .ssh_url)

REPO_URL=$(gh repo view $REPO_NAME | awk 'NR==1 {print $2}' | sed 's/^/git@github.com:/; s/$/.git/')

# Set the remote origin using SSH URL
git remote add origin $REPO_URL

# Create an initial commit
echo "# $REPO_NAME" > README.md
git add README.md
git commit -m "Initial commit"

# Push to GitHub
git push -u origin main

echo "Repository $REPO_NAME created and pushed to GitHub successfully."
