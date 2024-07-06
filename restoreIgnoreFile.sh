#!/bin/bash
clear

#
# https://dev.to/nishina555/how-to-ignore-files-already-managed-with-git-locally-19oo
#
argv=$1
LEN=${#1}
if [ $LEN -gt 1 ]; then
echo 'and the bunnymen'
    git update-index --no-skip-worktree $1
fi

# confirm the file will be skipped
# git ls-files　shows all files managed by git.
# -v check the file being ignored.
# --skip-worktree is displayed withS
git ls-files -v | grep ^S