#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias la='ls -a'
alias v='vim'
alias sv='sudo -E vim'
#alias r='ranger'
#alias f='vifm'
alias f='~/.config/vifm/scripts/vifmrun'
alias m='mupdf'
alias s='sxiv'
alias fuck='sudo $(history -p !!)'

function cl {
	cd $1
	ls
}

alias uni='cd /mnt/windows/Users/Justin/Desktop/Uni'

#(cat ~/.cache/wal/sequences &)

#shopt -s autocd

