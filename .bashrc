#!/usr/bin/env bash

#################################################
# This file is Inspired by Chris Titus' .bashrc #
# and the default Mint Linux one                #
#################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#show system info on terminal start up
if [[ -f /usr/bin/fastfetch ]]; then
    /usr/bin/fastfetch
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

############################
#    EXPORTS & BEHAVIOR    #
############################

export EDITOR=nvim
export VISUAL=nvim

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Allow ctrl-S for history navigation (with ctrl-R)
#[[ $- == *i* ]] && stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

############################
#         HISTORY          #
############################

export HISTSIZE=500
export HISTFILESIZE=1000
export HISTTIMEFORMAT="%F %T" # add timestamp to history
export HISTCONTROL=erasedups:ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
PROMPT_COMMAND='history -a'

############################
#          COLOR           #
############################

#export TERM='xterm-256color'

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'


# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

############################
#          ALIAS           #
############################

alias ls='ls --color=auto'        #color
alias la='ls -Al'                 #Almost all listing
alias lc='ls -CA'                 #column almos all
alias lf="ls -al | egrep -v '^d'" #files only
alias ld="ls -al | egrep '^d'"    #dirs only

alias home='cd ~'
alias docs='cd ~/Documents/'
alias downs='cd ~/Downloads/'
alias vids='cd ~/Videos/'
alias songs='cd ~/Music/'
alias pics='cd ~/Pictures/'
alias root='cd /'
alias rice='cd ~/.config/suckless/'
alias lbin='cd ~/.local/bin'
alias ..='cd ..'
alias cd2='cd ../..'

alias grep='grep --color=auto'
alias ip='ip --color=auto'

alias vim="~/.local/bin/nvim-linux-x86_64.appimage"
alias ssh-pi="ssh -i ~/.ssh/pihole pihole@192.168.1.250"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

############################
#         FUNCTIONS        #
############################

#ls after every cd
#now my habit is done for me!
cd ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

eval "$(starship init bash)"
