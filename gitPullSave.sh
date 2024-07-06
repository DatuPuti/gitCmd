#!/bin/bash
git fetch
git stash save pullSave
git merge '@{u}'
git stash pop pullSave
git status