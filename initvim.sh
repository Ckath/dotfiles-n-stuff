#!/bin/bash
# minimal init script for vim

mkdir -p ~/.vim/.undo ~/.vim/.backup ~/.vim/.swp ~/.vim/autoload
curl https://raw.githubusercontent.com/danishprakash/vim-zen/master/zen.vim > ~/.vim/autoload/zen.vim
vim
