#!/bin/bash

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
  echo "GitHub CLI (gh) could not be found. Please install it first."
  exit 1
fi

# Check if two arguments are provided: old_name and new_name
if [ $# -ne 2 ]; then
  echo "Usage: $0 <old-repository-name> <new-repository-name>"
  exit 1
fi

OLD_REPO_NAME=$1
NEW_REPO_NAME=$2

# Rename the repository on GitHub
gh repo rename $OLD_REPO_NAME $NEW_REPO_NAME

# Update local Git repository remote URL
git remote set-url origin git@github.com:$(gh repo view $NEW_REPO_NAME --json owner --jq .owner.login)/$NEW_REPO_NAME.git

echo "Repository renamed from $OLD_REPO_NAME to $NEW_REPO_NAME successfully."

