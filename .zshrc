# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/justin/.zshrc'

autoload -Uz compinit
compinit
_comp_options+=(globdots)

autoload -U colors && colors
PS1="[%n@%M %1~] "
setopt CORRECT

# Aliases
alias ls='ls --color=auto'
alias la='ls -a'
alias v='nvim'
alias sv='sudo -E vim'
alias fuck='sudo $(history -p !!)'

# This is handy
alias uni='cd /mnt/c/Users/Justin/Desktop/Uni'

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
