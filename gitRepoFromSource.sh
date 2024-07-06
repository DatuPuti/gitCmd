#!/bin/bash
projName=$1
gitRepo=$2

projUrl="https://github.com/" $gitRepo + "/" + $projName + ".git"

echo "# create github repo from source" >> README.md
#git init
#git add README.md
#git commit -m "first commit"
#git branch -M main
#git remote add origin https://github.com/tborland-orbis/mvnOutcome.git
#git push -u origin main

printf projName
printf projUrl