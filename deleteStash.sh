#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

# delete the most recent stash entry
git stash drop

# delete a specific stash
git stash drop stash@{1}

# delete all stashes
git stash clear