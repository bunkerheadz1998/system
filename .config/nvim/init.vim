set t_Co=256
set background=dark
set termguicolors
set lazyredraw

set noreadonly

set nobackup
set noswapfile
set undofile
set undodir=$HOME/.vim/vimundo

set ignorecase
set incsearch
set hlsearch

set re=2

set number

set fcs=stl:─,stlnc:─,vert:\|
let &fillchars ..= ',eob: '

let g:netrw_banner=0

set nocompatible
filetype plugin indent on
syntax on

set nofixeol

"set ai
set tabstop=2
set softtabstop=2
set shiftwidth=2

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set wildmenu
set omnifunc=csscomplete

" Key bindings
inoremap jj <Esc>
let mapleader = ','

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>rl :so ~/.vimrc<cr>

" UI
set laststatus=0

" Color scheme
hi statusline guibg=NONE guifg=#ffafd7

" Processing
let g:ale_linters = {
\	'javascript': ['eslint'],
\	'typescript': ['eslint'],
\	'glsl': ['glslang'],
\	'yaml': ['yamllint']
\}

let g:ale_fixers = {
\	'javascript': ['prettier', 'eslint'],
\	'typescript': ['prettier', 'eslint']
\}

let g:svelte_preprocessors = ['typescript']

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'HerringtonDarkholme/yats.vim'
	Plugin 'dense-analysis/ale'
	Plugin 'burner/vim-svelte'
call vundle#end()

