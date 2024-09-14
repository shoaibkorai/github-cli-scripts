#!/bin/bash

# Prompt for the pull request title
read -p "Enter the title of your pull request: " TITLE

# Prompt for the pull request description
read -p "Enter the description of your pull request: " DESCRIPTION

# Prompt for the base branch
read -p "Enter the base branch (e.g., main): " BASE_BRANCH

# Prompt for the head branch
read -p "Enter the head branch (e.g., your-username:my-feature-branch): " HEAD_BRANCH

echo "Creating a pull request..."
echo "Title: $TITLE"
echo "Description: $DESCRIPTION"
echo "Base branch: $BASE_BRANCH"
echo "Head branch: $HEAD_BRANCH"

# Create a pull request using gh CLI
gh pr create --title "$TITLE" --body "$DESCRIPTION" --base "$BASE_BRANCH" --head "$HEAD_BRANCH"

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Pull request has been created."
else
  echo "Failed to create the pull request. Please check the details and try again."
fi

