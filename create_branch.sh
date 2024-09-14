#!/bin/bash

# Check if the branch name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 branch-name"
  exit 1
fi

# Assign the first argument to BRANCH_NAME variable
BRANCH_NAME=$1

# Create a new branch
git checkout -b "$BRANCH_NAME"

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Branch $BRANCH_NAME has been created."
else
  echo "Failed to create the branch. Please check the branch name and try again."
fi

