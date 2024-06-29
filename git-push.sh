#!/bin/bash

# Ask for commit message
read -p "Enter commit message: " commit_message

# Ask for branch name
read -p "Enter branch name (press Enter for default branch): " branch_name

# Use default branch (main) if no branch name is provided
if [ -z "$branch_name" ]; then
    branch_name="main"
fi

# Add all changes, commit with the provided message, and push to the specified branch
git add .
git commit -m "$commit_message"
git push origin "$branch_name"

echo "Pushed to branch $branch_name with message: $commit_message"

