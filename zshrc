# -------------------------------------------------------------------
# Oh-My-Zsh Configuration
# -------------------------------------------------------------------

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sporty_256"
export UPDATE_ZSH_DAYS=13
source $ZSH/oh-my-zsh.sh
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# -------------------------------------------------------------------
# Plugin
# -------------------------------------------------------------------

plugins=(git mvn sublime autojump docker)

alias disc='df -h'
alias proxy=". /bin/proxy.sh"
alias plz="sudo !!"
alias ls="ls -G"

alias destp="xinput set-prop 13 'Device Enabled' 0"
alias acttp="xinput set-prop 13 'Device Enabled' 1"

export EDITOR=vim

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
 
# return my IP address
function myip() {
     #TODO make it detect interfaces 
     ifconfig lo0 | grep 'inet '  | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
     ifconfig en0 | grep 'inet '  | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet '  | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

#Added to have shellcheck in the path (used in vimrc by syntastic) 
export PATH=$PATH:~/.cabal/bin/

