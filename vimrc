"
" Vundle package manager.
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Requires linting tools like `jshint` to be installed and in the $PATH
Bundle 'scrooloose/syntastic'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-scripts/Smart-Home-Key'
Bundle 'w0ng/vim-hybrid'
Bundle 'pangloss/vim-javascript'
Bundle 'maksimr/vim-jsbeautify'
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
set showcmd
set wildmenu
set wildmode=list:longest,full
set title
set laststatus=2
set ruler
set cursorline
set ttyfast
set scrolloff=4
set backupdir=~/.vim-backup
set dir=~/.vim-swap

"
" Search.
"
set incsearch
set ignorecase
set gdefault

"
" Indentation.
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent

autocmd filetype javascript setlocal sts=2 sw=2 expandtab
"
" Colors.
"
set background=light
try
	color hybrid
catch
endtry

"
" MacVim
"
if has('gui_macvim')
	set guifont=Menlo:h10
	set macmeta
endif

"
" Key binds.
"
let mapleader=","
nnoremap <C-l> :nohl<CR><C-l>
map Q <Nop>
map 0 ^

map <ESC>< <M-<>
map! <ESC>< <M-<>
nnoremap <M-<> :bp!<CR>
inoremap <M-<> <Esc>:bp!<CR>
map <ESC>> <M->>
map! <ESC>> <M->>
nnoremap <M->> :bn!<CR>
inoremap <M->> <Esc>:bn!<CR>

" PuTTY
map <silent> <Esc>[1~ :SmartHomeKey <CR>
imap <silent> <Esc>[1~ <C-O>:SmartHomeKey<CR>

" gnome-terminal
map <silent> <Esc>OH :SmartHomeKey <CR>
imap <silent> <Esc>OH <C-O>:SmartHomeKey<CR>

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

"
" Plugins
"

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules$',
  \ 'file': '\~$'
  \ }

" Syntastic
let g:syntastic_auto_jump=2
let g:syntastic_error_symbol="!!"
let g:syntastic_error_symbol="??"

" DelimitMate
let g:delimitMate_expand_cr=1
