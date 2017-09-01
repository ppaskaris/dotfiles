#!/bin/bash

# symlink the dotfiles \o/
dotfiles="vimrc gitconfig aliases bashrc3p0 inputrc gitignore eslintrc"
for dotfile in $dotfiles ; do
	ln -nsf ~/dotfiles/$dotfile ~/.$dotfile
done

# get the git-prompt.sh
curl --silent https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

# put the bashrc3p0 in the bashrc
mkdir -p ~/.bin
if ! grep -Fxq ". ~/.bashrc3p0" ~/.bashrc ; then
	echo ". ~/.bashrc3p0" >> ~/.bashrc
fi

# setup the vim folders
mkdir -p $HOME/.vim-backup
mkdir -p $HOME/.vim-swap

# setup the vundles
vundir="$HOME/.vim/bundle/Vundle.vim"
if command -v git >/dev/null 2>&1 ; then
	if [ -d $vundir ] ; then
		git -C $vundir pull
	else
		git clone https://github.com/gmarik/Vundle.vim.git $vundir
	fi
else
	echo "skipping vundle plugins because git is missing"
fi

if command -v vim >/dev/null 2>&1 ; then
	vim +PluginInstall +qall
else
	echo "skipping vundle install because vim is missing"
fi

# setup the nodes
modules="http-server json"
if command -v npm >/dev/null 2>&1 ; then
	npm install -g $modules
else
	echo "skipping npm packages because npm is missing"
fi
