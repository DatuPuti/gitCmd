#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

git add .
git commit .
git status

git log --pretty=format:"%h - %an, %ar : %s"
