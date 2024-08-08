#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

curDir=$(pwd)
echo "The current directory is : $curDir"
applyDevPatch $curDir "./../gitDevPatch.patch"
