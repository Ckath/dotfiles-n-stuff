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
bindkey "^?" backward-delete-char
export KEYTIMEOUT=1

# Alias | Functions
alias :q="exit"
alias cp="cp -i"
alias ssh="TERM=xterm-256color ssh"
alias pacccache="paccache -rk2 && paccache -ruk0"
alias lidignore="systemd-inhibit --what=handle-lid-switch sleep 666d"
alias pakkuscuffedgitupdate="pakku -S \$(pakku -Qq | grep \"\-git\")"

wttr() { curl wttr.in/"$1" }
mpvyt() { mpv ytdl://ytsearch66:"$*" }
mkcd() { mkdir -p "$1";cd "$1" }
scanwlan() { sudo iwlist wlp3s0 scanning essid $1 }

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
if [ -n "$SSH_CONNECTION" ] && [ -z "$TMUX" ]; then
    export DISPLAY=:0
    tmux a || tmux
fi
