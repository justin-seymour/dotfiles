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
alias f='vifm'
#alias f='~/.config/vifm/scripts/vifmrun $(pwd)'
alias m='mupdf'
alias s='sxiv'
alias fuck='sudo $(history -p !!)'

alias t='~/Documents/rcode/todo/todo'

function cl {
	cd $1
	ls
}

function scr {
    touch $1
    echo -e "#!/bin/bash\n\n" >> $1
    #printf "#!/bin/bash\n" >> $1
    chmod +x $1
    v $1
}

function hack {
    echo $@ hacked
}

alias uni='cd /mnt/c/Users/Justin/Desktop/Uni'

#shopt -s autocd

