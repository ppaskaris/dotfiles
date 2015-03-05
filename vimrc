"
" Vundle package manager.
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/Vundle.vim'

Bundle 'w0ng/vim-hybrid'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'vim-scripts/Smart-Home-Key'

" Requires linting tools like `jshint` to be installed and in the $PATH
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'

Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'

Bundle 'elzr/vim-json'
Bundle 'mxw/vim-jsx'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'tpope/vim-markdown'

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
set hidden
let g:vim_json_syntax_conceal=0

"
" Search.
"
set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault

"
" Indentation.
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab

autocmd filetype javascript setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd filetype html setlocal ts=2 sts=2 sw=2 noexpandtab

"
" Colors.
"
set background=dark
try
	color hybrid
catch
endtry

"
" MacVim
"
if has('gui_macvim')
	set guifont=Menlo:h12
	set macmeta
endif

"
" Key binds.
"
nnoremap <C-l> :nohl<CR><C-l>
map Q <Nop>

map <ESC>< <M-<>
map! <ESC>< <M-<>
nnoremap <M-<> :bp!<CR>
inoremap <M-<> <Esc>:bp!<CR>
map <ESC>> <M->>
map! <ESC>> <M->>
nnoremap <M->> :bn!<CR>
inoremap <M->> <Esc>:bn!<CR>

" PuTTY
map <silent> <Esc>[1~ :SmartHomeKey<CR>
imap <silent> <Esc>[1~ <C-O>:SmartHomeKey<CR>
map <silent> <Home> :SmartHomeKey<CR>
imap <silent> <Home> <C-O>:SmartHomeKey<CR>

" gnome-terminal
map <silent> <Esc>OH :SmartHomeKey <CR>
imap <silent> <Esc>OH <C-O>:SmartHomeKey<CR>

"
" Commands.
"

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
  \ 'dir':  '\.git$\|node_modules\|build\|dist',
  \ 'file': '\~$'
  \ }

" Syntastic
let g:syntastic_auto_jump=2
let g:syntastic_error_symbol="!!"
let g:syntastic_error_symbol="??"
let g:syntastic_filetype_map = { "html.mustache": "handlebars" }
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" DelimitMate
let g:delimitMate_expand_cr=1

" Markdown
let g:markdown_fenced_languages = [ 'javascript', 'sh' ]
