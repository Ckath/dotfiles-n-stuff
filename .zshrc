# Zsh Config
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu yes select
zstyle ':completion:*' menu select
setopt MENU_COMPLETE
export HISTFILE=/home/cat/.zsh_history
export SAVEHIST=100000
export HISTSIZE=100000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

# Theming
source /home/cat/.zsh/mh.zsh
# History Substring Search
source /home/cat/.zsh/zsh-history-substring-search.zsh
# Set term title correctly
source /home/cat/.zsh/termsupport.zsh

# Vi Binds
bindkey -v
bindkey "\e[A" history-substring-search-up
bindkey "\e[B" history-substring-search-down
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down
export KEYTIMEOUT=1

# Alias | Functions
alias mountCompaq="gio mount -a smb://COMPAQ/Torrents"
alias mountWindows="sudo mkdir -p /run/media/cat/windows ; sudo mount /dev/sda2 /run/media/cat/windows"
alias rangerme="mountCompaq ; ranger /run/user/1000/gvfs/smb-share:server=compaq,share=torrents/anime"
alias remirrors="sudo chown cat:users /etc/pacman.d/mirrorlist;\
    sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.pacnew;\
    sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.pacnew >! /etc/pacman.d/mirrorlist;\
    cat /etc/pacman.d/mirrorlist"
alias pacman="\pacaur"
alias pacaur="\pacman"
alias mic1sim="java -jar ~/School/Mic1MMV/bin/Mic1MMV_hr.jar"
alias comport="ls /dev | grep ACM"
alias quartus64="/opt/altera/16.0/quartus/bin/quartus --64bit"
alias nios2="/opt/altera/16.0/nios2eds/bin/eclipse-nios2"
alias ucosInit="wineconsole ~/School/uCos-MinGW/msys.bat ;\
    cd ~/School/uCos-MinGW/uCOS-II/Ports/80x86/WIN32/GCC-MINGW/labs"
alias vncShare="x0vncserver -display :0 -passwordfile ~/.vnc/passwd"
alias addkey="gpg --keyserver hkp://pgp.mit.edu --recv-keys"
alias tangleroadssh="ssh -p 5013 ckat@trds.acr.moe"
alias pacccache="paccache -rk2 ; paccache -ruk0"
alias lidignore="systemd-inhibit --what=handle-lid-switch sleep 66d"
alias sspace="sshuttle -r cat@ckat.space 0/0 --dns || sshuttle -r cat@ckat.space 0/0 --dns" 
alias regrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias :q="exit"
alias cp="cp -i"

wttr() { curl wttr.in/"$1" }
mpvyt() { mpv ytdl://ytsearch66:"$*" }
mkcd() { mkdir "$1";cd "$1" }


dwm-remake() {
    ORGDIR="$(pwd)"
    cd ~/dwm
    make clean install
    killall dwm
    cd "$ORGDIR"
}

colorsdesu() {
    T=':/3'
    echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";
    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m'; do 
        FG=${FGs// /}
        echo -en " $FGs \033[$FG  $T  "
        for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
            echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
        done
        echo;
    done
    echo
}

# startx if login, start tmux if connecting from ssh
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
if [[ -n "$SSH_CONNECTION" ]] && ! [[ -n "$TMUX" ]]; then
    tmux a || tmux
fi
