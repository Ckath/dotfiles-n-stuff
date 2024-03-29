#!/bin/bash

echo -n "are you sure you're in the dotfiles directory right now? [y/N] "
read -r CONTINUE_INSTALL

if [ "$CONTINUE_INSTALL" != "y" ] && [ "$CONTINUE_INSTALL" != "Y" ]; then
    exit 1
fi

shopt -s dotglob
DOT_DIR="$(pwd)"

git grep -l "/home/cat" | xargs sed -i "s:/home/cat:${HOME}:g"

rm -rf ~/.zsh 2> /dev/null
ln -sfv "$DOT_DIR"/.vimrc \
    "$DOT_DIR"/.tmux.conf \
    "$DOT_DIR"/.zshrc \
    "$DOT_DIR"/.zprofile \
    "$DOT_DIR"/.zsh ~/

sudo ln -sfv "$DOT_DIR"/makepkg.conf /etc/makepkg.conf

# server setup ends here, no need for this on servers
[[ "$1" == "server" ]] || [[ "$1" == "vps" ]] && exit

rm -rf ~/scripts 2> /dev/null
ln -sfv "$DOT_DIR"/.Xresources \
	"$DOT_DIR"/.xinitrc \
	"$DOT_DIR"/scripts ~/
mkdir ~/.weechat
ln -sfv "$DOT_DIR"/.weechat/* ~/.weechat

mkdir -p ~/.config/dunst \
	~/.config/pulseaudio-ctl \
	~/.config/networkmanager-dmenu \
	~/.config/pulse \
	~/.config/procps 2> /dev/null
ln -sfv "$DOT_DIR"/.config/Trolltech.conf ~/.config
ln -sfv "$DOT_DIR"/.config/pulseaudio-ctl/config ~/.config/pulseaudio-ctl/
ln -sfv "$DOT_DIR"/.config/pulse/* ~/.config/pulse
ln -sfv "$DOT_DIR"/.config/procps/* ~/.config/procps
mkdir ~/.config/mpv 2> /dev/null || rm -rf ~/.config/mpv/scripts
ln -sfv "$DOT_DIR"/.config/mpv/* ~/.config/mpv
ln -sfv "$DOT_DIR"/.config/fuf ~/.config

sudo ln -sfv "$DOT_DIR"/pacman.conf \
	"$DOT_DIR"/pakku.conf /etc

sudo ln -sfv "$DOT_DIR"/xorg.conf.d/* /etc/X11/xorg.conf.d

$(cd ~/.mozilla/firefox/*.default && mkdir chrome)
ln -svf "$DOT_DIR"/firefoxcss/* ~/.mozilla/firefox/*.default/chrome

mkdir ~/.urxvt
ln -sfv "$DOT_DIR"/.urxvt/* ~/.urxvt

~/scripts/recolor.sh -f

sudo mkdir -p /etc/X11/xorg.conf.d
# thinkpad/desktop specifics
if [ "$1" == "thinkpad" ]; then
	sudo ln -sfv "$DOT_DIR"/thinkpad/xorg.conf.d/* /etc/X11/xorg.conf.d
	sudo ln -sfv "$DOT_DIR"/thinkpad/xorg.conf.d/* /etc/X11/xorg.conf.d
else
	sudo ln -sfv "$DOT_DIR"/xorg.conf.d/* /etc/X11/xorg.conf.d
	ln -sfv "$DOT_DIR"/thinkpad/.xmodmap ~/
fi
