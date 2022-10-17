set -x

dotfiles="vimrc gitconfig zshrc3p0"
for dotfile in $dotfiles ; do
	ln -nsf ~/dotfiles/$dotfile ~/.$dotfile
done

mkdir -p ~/.bin
mkdir -p ~/.vim-backup
mkdir -p ~/.vim-swap

curl --silent https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

if ! grep -Fxq "source ~/.zshrc3p0" ~/.zshrc ; then
	echo "source ~/.zshrc3p0" >> ~/.zshrc
fi

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
