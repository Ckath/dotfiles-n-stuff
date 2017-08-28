#!/bin/bash
# shoddy way to update dotfiles to latest while keeping changes

git stash
git pull -r
git stash pop
