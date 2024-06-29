#!/bin/bash

# Function to display usage
usage() {
  echo "Usage: $0 <repository-url-or-name>"
  echo "Example: $0 https://github.com/user/repo.git"
  echo "         $0 user/repo"
  exit 1
}

# Check if the user provided a repository URL or name
if [ -z "$1" ]; then
  usage
fi

# Store the input
input=$1

# Convert the input to SSH format
if [[ $input == https://github.com/* ]]; then
  ssh_url=$(echo "$input" | sed -e 's/^https:\/\/github\.com\//git@github.com:/' -e 's/\.git$/.git/')
else
  ssh_url="git@github.com:$input.git"
fi

# Clone the repository
git clone "$ssh_url"

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "Repository cloned successfully."
else
  echo "Failed to clone the repository."
fi
