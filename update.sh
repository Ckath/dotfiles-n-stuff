#!/bin/bash
# shoddy way to update dotfiles to latest while keeping changes

git stash
printf "\n----------------------------------------------------- updating\n"
git pull -r
printf "\n----------------------------------------------------- restoring local changes\n"
git stash pop
