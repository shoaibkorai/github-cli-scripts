#!/bin/bash

# Function to print usage instructions
usage() {
    echo "Usage: $0 <current-repo-name> <new-repo-name>"
    exit 1
}

# Check if the required number of arguments is provided
if [ "$#" -ne 2 ]; then
    usage
fi

# Set variables for the current and new repository names
CURRENT_REPO=$1
NEW_REPO=$2
USERNAME="shoaibkorai"

# Rename the repository using the GitHub CLI
echo "Renaming repository '$CURRENT_REPO' to '$NEW_REPO' for user '$USERNAME'..."
gh repo rename "$NEW_REPO" --repo "$USERNAME/$CURRENT_REPO" -y

# Check if the rename was successful
if [ $? -eq 0 ]; then
    echo "Repository renamed successfully!"
else
    echo "Failed to rename repository."
fi

