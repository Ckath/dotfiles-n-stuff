#!/bin/bash
# minimal init script for vim

mkdir -p ~/.vim/.undo ~/.vim/.backup ~/.vim/.swp
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh ~/.vim
vim
