set -ex

dotfiles="vimrc gitconfig gitexcludes zshrc3p0"
for dotfile in $dotfiles ; do
	ln -nsf ~/dotfiles/$dotfile ~/.$dotfile
done

mkdir -p ~/.bin
mkdir -p ~/.vim-backup
mkdir -p ~/.vim-swap

GitPromptPath="$HOME/.zsh/git-prompt"
[[ -d $GitPromptPath ]] && git -C $GitPromptPath pull || git clone git@github.com:olivierverdier/zsh-git-prompt.git $GitPromptPath

if ! grep -Fxq "source ~/.zshrc3p0" ~/.zshrc ; then
	echo "source ~/.zshrc3p0" >> ~/.zshrc
fi

VundlePath="$HOME/.vim/bundle/Vundle.vim"
[[ -d $VundlePath ]] && git -C $VundlePath pull || git clone https://github.com/gmarik/Vundle.vim.git $VundlePath

vim +PluginInstall +qall
