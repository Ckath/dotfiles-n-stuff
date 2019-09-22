#!/bin/bash
# minimal init script for vim

mkdir -p ~/.vim/.undo ~/.vim/.backup ~/.vim/.swp
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
vim -c "packadd minpac | source ~/.vimrc | call minpac#update('', {'do': 'quit'})"
