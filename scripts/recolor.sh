#!/bin/bash
# recolor a bunch of applications based on .Xresources colorscheme

# recolor terminal
toilet -f fonts/lean.flf urxvt.. --gay -t
xrdb ~/.Xresources

# collect colors
FG=$(awk '/foreground:/{ print $2 }' ~/.Xresources)
BG=$(awk '/background:/{ print $2 }' ~/.Xresources)
SECFG=$(awk '/color15:/{ print $2 }' ~/.Xresources)
SECBG=$(awk '/color8:/{ print $2 }' ~/.Xresources)
RED=$(awk '/color1:/{ print $2 }' ~/.Xresources)

# recolor dunst
toilet -f fonts/lean.flf dunst.. --gay -t
mkdir -p ~/.config/dunst 2> /dev/null
cp ~/scripts/recolor_templates/dunst ~/.config/dunst/dunstrc
sed -i "s/__FG/$FG/g" ~/.config/dunst/dunstrc
sed -i "s/__BG/$BG/g" ~/.config/dunst/dunstrc
sed -i "s/__SECFG/$SECFG/g" ~/.config/dunst/dunstrc
sed -i "s/__SECBG/$SECBG/g" ~/.config/dunst/dunstrc
sed -i "s/__RED/$RED/g" ~/.config/dunst/dunstrc
killall dunst

# recolor nm-dmenu
toilet -f fonts/lean.flf nm-dmenu.. --gay -t
mkdir -p ~/.config/networkmanager-dmenu 2> /dev/null
cp ~/scripts/recolor_templates/nm-dmenu ~/.config/networkmanager-dmenu/config.ini
sed -i "s/__FG/$FG/g" ~/.config/networkmanager-dmenu/config.ini
sed -i "s/__BG/$BG/g" ~/.config/networkmanager-dmenu/config.ini
sed -i "s/__SECFG/$SECFG/g" ~/.config/networkmanager-dmenu/config.ini
sed -i "s/__SECBG/$SECBG/g" ~/.config/networkmanager-dmenu/config.ini

if [ "$1" != "--fast" ] && [ "$1" != "-f" ]; then
    # recolor gtk theme
    toilet -f fonts/lean.flf gtk-theme.. --gay -t
    cp ~/scripts/recolor_templates/gtk ~/gitstuff/arc-undead-recolor/conf
    sed -i "s/__FG/$FG/g" ~/gitstuff/arc-undead-recolor/conf
    sed -i "s/__BG/$BG/g" ~/gitstuff/arc-undead-recolor/conf 
    sed -i "s/__SECFG/$SECFG/g" ~/gitstuff/arc-undead-recolor/conf
    sed -i "s/__SECBG/$SECBG/g" ~/gitstuff/arc-undead-recolor/conf
    cd ~/gitstuff/arc-undead-recolor/ || exit
    ./install.sh
fi
