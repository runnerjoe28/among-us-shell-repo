# CONFIGURE THE $PATH

# Add `~/bin` to the `$PATH` if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# Add `~/.local/bin` to the `$PATH` if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi



# LOAD OTHER KEY DOTFILES
# .bash_aliases stores aliases
# .bash_prompt formats the terminal/prompt
# .bash_extra is for other settings (ignored by git)
for file in ~/.{bash_aliases,bash_extra,bash_prompt}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;



# CONFIGURE HISTORY FILE SETTINGS

# Ignores 2 types of commands for history file
# 1: duplicate commands   2: commands that start with a space
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Setting depth of history stored
HISTSIZE=1000           # Number of lines stored while session is ongoing	
HISTFILESIZE=2000       # Number of lines allowed in history at startup or end of session



# UPDATE OTHER KEY CONFIGURATIONS

# Check the window size after each command and adjust terminal
shopt -s checkwinsize

# Make "less" more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi