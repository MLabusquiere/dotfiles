#!/bin/sh -e

#This script install dotfiles and mv old configuration at .dotfiles_old

DIR=~/.dotfiles
OLDDIR=~/.dotfiles_old
DOTFILES="gitconfig vimrc zshrc config/i3/config"


for file in $DOTFILES
do
	if [ -f "~/.$file" ] && ! [ -h "$HOME/.$file" ]
	then
		mkdir -p $OLDDIR
		echo >&2 "-- Dotfile exist : mv ~/.$file at $OLDDIR/.$file"
		mv "$HOME/.$file" "$OLDDIR"
	fi
	echo >&2 "-- Creating symlink to $file in home directory."
	ln --force --symbolic "$DIR/$file" "$HOME/.$file"
done

#vim install and setup
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
	echo >&2 "setup vim for a first instalatiion"
	git clone https://github.com/VundleVim/Vundle.vim.git \
	    ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
fi

if which >/dev/null 2>/dev/null git
then
	ln --force --symbolic $DIR/git-templates $HOME/.git-templates

fi

if which apt-get >/dev/null 2>/dev/null && ! which npm >/dev/null 2>/dev/null
then
	sudo apt-get update && sudo apt-get install npm -y
	#zshrc configure npm to not use sudo
	zsh
	npm install --global diff-so-fancy git-recall
fi
