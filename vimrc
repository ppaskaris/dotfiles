"
" Vundle package manager.
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/Vundle.vim'

Bundle 'bronson/vim-trailing-whitespace'
Bundle 'elzr/vim-json'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'mxw/vim-jsx'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'stephpy/vim-yaml'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/AdvancedSorters'
Bundle 'vim-scripts/ingo-library'
Bundle 'vim-scripts/Smart-Home-Key'
Bundle 'w0ng/vim-hybrid'

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
set ts=2 sts=2 sw=2 noet
autocmd FileType coffee setl ts=2 sts=2 sw=2 et
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
autocmd Filetype gitcommit setl spell

"
" Colors.
"
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
	set guioptions-=r
endif

"
" Key binds.
"
nnoremap <C-l> :nohl<CR><C-l>
map Q <Nop>

map <Esc>< <M-<>
map! <Esc>< <M-<>
nnoremap <M-<> :bp!<CR>
inoremap <M-<> <Esc>:bp!<CR>
map <Esc>> <M->>
map! <Esc>> <M->>
nnoremap <M->> :bn!<CR>
inoremap <M->> <Esc>:bn!<CR>

function! SafeLocationNext()
	try
		lnext
	catch /^Vim\%((\a\+)\)\=:E553/
		lfirst
	catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
	endtry
endfunction

nnoremap <silent> <Space> :call SafeLocationNext()<CR>

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

" Formats JSON with tabs for indentation.
command! Json %!json -o json-tab

"
" Plugins
"

" CtrlP
let g:ctrlp_map='<C-p>'
let g:ctrlp_custom_ignore={
  \ 'dir':  '\.git$\|node_modules\|build\|dist\|jspm_packages',
  \ 'file': '\~$'
  \ }
let g:ctrlp_follow_symlinks=1

" Syntastic
let g:syntastic_filetype_map={"html.mustache": "handlebars"}
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_always_populate_loc_list=1

" DelimitMate
let g:delimitMate_expand_cr=1

" Markdown
let g:markdown_fenced_languages=['javascript', 'sh']

" Indent Guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
autocmd VimEnter * :IndentGuidesEnable
