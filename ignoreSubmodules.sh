#!/bin/bash

# Change directory to the services directory
cd services

# Iterate over each directory (assumed to be a repository)
for repo_dir in */; do
    # Check if it's a directory
    if [ -d "$repo_dir/.git" ]; then
        echo "Entering repository: $repo_dir"
        # Change directory to the repository
        cd "$repo_dir"
        
        # Execute git update-index --skip-worktree .
        git update-index --skip-worktree .

        # Move back to the parent directory
        cd ..
    else
        echo "Skipping $repo_dir - Not a git repository"
    fi
done
