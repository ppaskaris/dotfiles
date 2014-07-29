"
" Vundle package manager.
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Bundle "kien/ctrlp.vim"
Bundle "Valloric/YouCompleteMe"
Bundle "scrooloose/syntastic"
Bundle "bronson/vim-trailing-whitespace"
Bundle "chriskempson/tomorrow-theme", {"rtp": "vim/"}
Bundle "pangloss/vim-javascript"
Bundle "maksimr/vim-jsbeautify"
Bundle 'einars/js-beautify'

call vundle#end()
filetype plugin indent on

"
" Editor.
"
syntax on
filetype plugin indent on
set mouse=a
set clipboard=unnamed
set hidden
set showcmd
set title
set laststatus=2
set cursorline
set ruler
set ttyfast

"
" Search.
"
set incsearch
set ignorecase
set gdefault
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules$',
  \ 'file': '\~$'
  \ }

"
" Indentation.
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent

"
" Colors.
"
try
	color Tomorrow-Night
catch
endtry

"
" Key binds.
"
let mapleader=","
let g:ctrlp_map = '<C-p>'
nnoremap <C-l> :nohl<CR><C-l>
map Q <Nop>
map 0 ^

map <ESC>< <M-<>
map! <ESC>< <M-<>
noremap <M-<> :bp!<CR>
map <ESC>> <M->>
map! <ESC>> <M->>
noremap <M->> :bn!<CR>

"
" Commands.
"

" Pesky 'invalid command: Q' messages.
command! Q q
command! W w

" Will allow you to use :w!! to write to a file using sudo if you forgot to
" sudo vim file (it will prompt for sudo password when writing)
" http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null %
