#!/bin/bash

echo -n "are you sure you're in the dotfiles directory right now? [y/N] "
read -r CONTINUE_INSTALL

if [ "$CONTINUE_INSTALL" != "y" ] && [ "$CONTINUE_INSTALL" != "Y" ]; then
    exit 1
fi

shopt -s dotglob
DOT_DIR="$(pwd)"

git grep -l "/home/cat" | xargs sed -i "s:/home/cat:$(echo ~):g"

rm -rf ~/.zsh 2> /dev/null
ln -sfv "$DOT_DIR"/.vimrc \
    "$DOT_DIR"/.tmux.conf \
    "$DOT_DIR"/.zshrc \
    "$DOT_DIR"/.zprofile \
    "$DOT_DIR"/.zsh ~/

sudo ln -sfv "$DOT_DIR"/makepkg.conf /etc/makepkg.conf

# server setup ends here, no need for this on servers
if [ "$1" != "--server" ] && [ "$1" != "--vps" ]; then
    rm -rf ~/scripts 2> /dev/null
    ln -sfv "$DOT_DIR"/.Xresources \
        "$DOT_DIR"/.xmodmap \
        "$DOT_DIR"/.xinitrc \
        "$DOT_DIR"/scripts ~/
    mkdir ~/.weechat
    ln -sfv "$DOT_DIR"/.weechat/* ~/.weechat

    mkdir -p ~/.config/ranger \
        ~/.config/dunst \
        ~/.config/pulseaudio-ctl \
        ~/.config/networkmanager-dmenu \
		~/.config/pulse 2> /dev/null
    ln -sfv "$DOT_DIR"/.config/Trolltech.conf ~/.config
    ln -sfv "$DOT_DIR"/.config/pulseaudio-ctl/config ~/.config/pulseaudio-ctl/
    ln -sfv "$DOT_DIR"/.config/ranger/* ~/.config/ranger
    ln -sfv "$DOT_DIR"/.config/pulse/* ~/.config/pulse
    mkdir ~/.config/mpv 2> /dev/null || rm -rf ~/.config/mpv/scripts
    ln -sfv "$DOT_DIR"/.config/mpv/* ~/.config/mpv
    sudo ln -sfv "$DOT_DIR"/tlp /etc/default/tlp

    sudo mkdir -p /etc/X11/xorg.conf.d
    sudo ln -sfv "$DOT_DIR"/xorg.conf.d/* /etc/X11/xorg.conf.d

    sudo ln -sfv "$DOT_DIR"/pacman.conf \
        "$DOT_DIR"/pakku.conf /etc
	
	sudo ln -sfv "$DOT_DIR"/grub /etc/default
	sudo ln -sfv "$DOT_DIR"/fuck_intel.conf /etc/modprobe.d/


    $(cd ~/.mozilla/firefox/*.default && mkdir chrome)
    ln -svf "$DOT_DIR"/userContent.css ~/.mozilla/firefox/*.default/chrome

    ~/scripts/recolor.sh -f
fi
