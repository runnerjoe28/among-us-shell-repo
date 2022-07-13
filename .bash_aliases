#!/usr/bin/env bash

# DEFAULT ALIASES FROM UBUNTU SOURCE BASHRC THAT I LIKED

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # alias ls='ls --color=auto'
    # alias dir='dir --color=auto'
    # alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Basic ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'



# ALIASES FROM @mathiasbynens dotfiles (https://github.com/mathiasbynens/dotfiles)

# Easier navigation: .., ..., ...., .....
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."



# CUSTOM ALIASES

# Some replacements for common tools I use
alias d="docker"
alias d-c="docker-compose"
alias g="git"
alias p="python3"
alias vs="code"

# Some fun ones
alias sus="echo ; cat ~/.bash_more/sus.txt"
