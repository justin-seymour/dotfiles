#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias la='ls -a'
alias v='nvim'
alias sv='sudo -E nvim'
alias m='mupdf'
alias s='sxiv'
alias fuck='sudo $(history -p !!)'

alias t='~/Documents/rcode/todo/todo'

function hack {
    echo $@ hacked
}

alias uni='cd /mnt/c/Users/Justin/Desktop/Uni'

