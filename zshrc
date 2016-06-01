# -------------------------------------------------------------------
# Utilitary methods
# -------------------------------------------------------------------

DEBUG=

log_debug()
{
	test -z "$DEBUG" || 
	echo >&2 "$@"	
}

source_cmd()
{
	 local file="$1" ; shift
	 if [[ -f "$file" ]]
	 then
		source "$file"
	 else
		log_debug "$@"
	 fi
}

add_to_path()
{
	for new_path in "$@"
	do
		if [[ -d "$new_path" ]]
		then
			export PATH=$PATH:$new_path
		else 
			log_debug "$new_path does not exist and will not be added to PATH"
		fi
	done
}

# -------------------------------------------------------------------
# Load env specific version
# -------------------------------------------------------------------

source_cmd ~/.profile 'No configuration specific found at ~/.profile'

# -------------------------------------------------------------------
# Oh-My-Zsh Configuration
# -------------------------------------------------------------------

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sporty_256"
export UPDATE_ZSH_DAYS=13
source_cmd $ZSH/oh-my-zsh.sh "Oh-my-zsh is not installed"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Avoid error when zsh can not expand
unsetopt nomatch

#Load autojump
source_cmd /usr/share/autojump/autojump.sh 'Autojump is not installed' 

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
# PROXY
# -------------------------------------------------------------------

if [[ -n "$PROXY" ]] 
then
	export http_proxy=http://$PROXY/
	export https_proxy=https://$PROXY/
	export no_proxy="$no_proxy,localhost,127.0.0.1,.local"
else
	log_debug 'No proxy setup configured : fill $PROXY'
fi

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------

 
# -------------------------------------------------------------------
# EXPORT
# -------------------------------------------------------------------
export EDITOR=vim

#Added to have shellcheck in the path (used in vimrc by syntastic) 
add_to_path ~/.cabal/bin/

#Usual opt bin
add_to_path /opt/bin /opt/maven/bin /opt/ghc/bin

# Colors for vim calendar plugin
export TERM=xterm-256color
