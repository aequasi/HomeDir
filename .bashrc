source ~/.colors.sh
source ~/.variables.sh
source ~/git-completion.sh
source ~/git-flow-completion.sh
function parse_git_dirty {
[[ $(git status -vsu no 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# History

# Ignoring duplicates and lines with spaces in front
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

force_color_prompt=yes
color_prompt=yes

# Setting PS1
export PS1="[\[$Red\]\u\[$Color_Off\]@\[$Blue\]$HOSTNAME\[$Color_Off\] \[$BGreen\]\w\[$Color_Off\]\[$BPurple\]\$(__git_ps1)\$(parse_git_dirty)\[$Color_Off\]] \$  "

# Setting up Dircolors
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
