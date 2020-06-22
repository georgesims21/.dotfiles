#!/bin/sh
# Deploys Hugo based site to georgesims21.github.io (via module) as HTML

devel_branch() {
    git add .
    msg="Updating development branch $(date)"
    if [ -n "$*" ]; then
	    msg="$*"
    fi
    git commit -m "$msg"
    git push
}

github_io_branch() {
    # Build the project.
    hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

    # Go To Public folder
    cd public

    # Add changes to git.
    git add .

    # Commit changes.
    msg="rebuilding site $(date)"
    if [ -n "$*" ]; then
    	msg="$*"
    fi
    git commit -m "$msg"

    # Push source and build repos.
    git push origin master

}

cd $HOME/github/blog

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to Development branch...\033[0m\n"
devel_branch

printf "\033[0;32mDeploying updates to github.io branch...\033[0m\n"
github_io_branch
