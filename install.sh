#!/bin/bash

echo -n "are you sure you're in the dotfiles directory right now? [y/N] "
read -r CONTINUE_INSTALL

if [ "$CONTINUE_INSTALL" != "y" ] && [ "$CONTINUE_INSTALL" != "Y" ]; then
    exit 1
fi

shopt -s dotglob
DOT_DIR="$(pwd)"

rm -rf ~/.zsh 2> /dev/null
ln -sfv "$DOT_DIR"/.vimrc \
    "$DOT_DIR"/.tmux.conf \
    "$DOT_DIR"/.zshrc \
    "$DOT_DIR"/.zprofile \
    "$DOT_DIR"/.zsh ~/

# server setup ends here, no need for this on servers
if [ "$1" != "--server" ] && [ "$1" != "--vps" ]; then
    rm -rf ~/scripts 2> /dev/null
    ln -sfv "$DOT_DIR"/.Xresources \
        "$DOT_DIR"/.xmodmap \
        "$DOT_DIR"/scripts ~/
    ln -sfv "$DOT_DIR"/.weechat/* ~/.weechat

    mkdir ~/.config 2> /dev/null
    ln -sfv "$DOT_DIR"/.config/TrollTech.conf ~/.config
    mkdir ~/.config/ranger 2> /dev/null
    ln -sfv "$DOT_DIR"/.config/ranger/* ~/.config/ranger
    mkdir ~/.config/networkmanager-dmenu 2> /dev/null
    ln -sfv "$DOT_DIR"/.config/networkmanager-dmenu/* ~/.config/networkmanager-dmenu
    mkdir ~/.config/mpv 2> /dev/null || rm -rf ~/.config/mpv/scripts
    ln -sfv "$DOT_DIR"/.config/mpv/* ~/.config/mpv
    mkdir ~/.config/dunst 2> /dev/null
    ln -sfv "$DOT_DIR"/.config/dunst/* ~/.config/dunst
fi
