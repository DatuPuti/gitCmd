#!/bin/bash

whoGoes="."
argv=$1

LEN=${#argv}
if [ $LEN -gt 1 ]; then
    whoGoes=$1
fi

git restore $whoGoes

git status