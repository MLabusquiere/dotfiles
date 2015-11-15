# -------------------------------------------------------------------
# Oh-My-Zsh Configuration
# -------------------------------------------------------------------

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sporty_256"
export UPDATE_ZSH_DAYS=13
source $ZSH/oh-my-zsh.sh
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Avoid error when zsh can not expand
unsetopt nomatch

#Load autojump
if [[ -f /usr/share/autojump/autojump.sh ]]
then
	. /usr/share/autojump/autojump.sh
fi

# -------------------------------------------------------------------
# Plugin
# -------------------------------------------------------------------

plugins=(git mvn sublime autojump docker)

# -------------------------------------------------------------------
# Aliases
# -------------------------------------------------------------------
alias disc='df -h'
alias plz="sudo !!"
alias ls="ls -G"

alias destp="xinput set-prop 13 'Device Enabled' 0"
alias acttp="xinput set-prop 13 'Device Enabled' 1"

alias viminstall="vim +PluginInstall +qall"
alias vimupdate="vim +PluginUpdate +qall"

alias idea='nohup /opt/idea/bin/idea.sh >/dev/null 2>&1 &' 
alias eclipse='nohup /opt/eclipse/eclipse >/dev/null 2>&1 &'


# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
 
export EDITOR=vim

#Added to have shellcheck in the path (used in vimrc by syntastic) 
export PATH=$PATH:~/.cabal/bin/

#Usual opt bin
export PATH=$PATH:/opt/maven/bin
export PATH=$PATH:/opt/ghc/bin

