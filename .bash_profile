#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR='nvim'
export BROWSER='firefox'
export TERMINAL='alacritty'

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx
fi
