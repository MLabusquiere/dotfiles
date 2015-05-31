#!/bin/sh -e

#This script install dotfiles and mv old configuration at .dotfiles_old

DIR=~/.dotfiles                    
OLDDIR=~/.dotfiles_old             
DOTFILES="gitconfig vimrc vim zshrc"    


for file in $DOTFILES
do
	if [ -f ~/.$file ] && ! [ -h ~/.$file ] 
	then
		mkdir -p $OLDDIR
		echo >&2 "-- Dotfile exist : mv ~/.$file at $OLDDIR/.$file"
		mv ~/.$file $OLDDIR
	fi
	echo >&2 "-- Creating symlink to $file in home directory."
	ln --force --symbolic $DIR/$file ~/.$file
done
