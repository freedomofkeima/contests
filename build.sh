#!/bin/bash

# Abort script if there is a non-zero error
set -e

remote=$(git config remote.origin.url)

# make a directory
mkdir gh-pages-branch

cd gh-pages-branch

# Setup a new repo
git config --global user.email "$GH_EMAIL" > /dev/null 2>&1
git config --global user.name "$GH_NAME" > /dev/null 2>&1
git init
git remote add --fetch origin "$remote"

# switch into the gh-pages branch
if git rev-parse --verify origin/gh-pages > /dev/null 2>&1
then
    git checkout gh-pages
    # delete any old site as we are going to replace it
    git rm -rf .
else
    git checkout --orphan gh-pages
fi

# Go back to previous directory
cd ..

# we can do something here, e.g., generate required HTML file
# TODO: Update this line
python generator.py

# Go to gh-pages-branch directory again
cd gh-pages-branch

# stage any changes and new files
git add -A

# now commit
git commit --allow-empty -m "Deploy [ci skip]"
# push
git push --force --quiet origin gh-pages > /dev/null 2>&1

# restore
cd ..
rm -rf gh-pages-branch

echo "Finish!"

