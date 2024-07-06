#!/bin/bash
clear

LEN=${#1}
#
# https://dev.to/nishina555/how-to-ignore-files-already-managed-with-git-locally-19oo
#
# --skip-worktree is the flag which means the files should change locally
if [ $LEN -gt 1 ]; then 
    echo "Ignoring file: " $1
    git update-index --skip-worktree $1
fi

# confirm the file will be skipped
# git ls-files　shows all files managed by git.
# -v check the file being ignored.
# --skip-worktree is displayed withS
git ls-files -v | grep ^S