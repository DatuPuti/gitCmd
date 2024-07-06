#!/bin/bash
theAction = " "

if [ $1 == "c" ]; then 
    theAction = "--continue"
elif [ $1 == "a" ]; then 
    theAction = "--abort"
elif [ $1 == "s" ]; then 
    theAction = "--skip"
fi

git cherry-pick $theAction
git status
