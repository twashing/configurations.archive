
"set term=builtin_xterm
"set nocompatible
source /Users/timothyw/.vim/syntax/clojure.vim
source /Users/timothyw/.vim/bundles/NERD_commenter.vim 
set ai
syntax on


let g:Powerline_symbols = 'fancy'

" installing tweaks from 'http://stevelosh.com/blog/2010/09/coming-home-to-vim/#pathogen'
filetype off
filetype plugin indent on
set modelines=0

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'


" clojure stuff 
let g:clj_highlight_builtins=1 
let g:clj_paren_rainbow=1

" some general stuff 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
" set nu
set backspace=indent,eol,start
set laststatus=2
let mapleader = ","

set ignorecase
set smartcase
set gdefault

" highlight search results as you type
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" use <tab> instead of % to match braces
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1

" use ; as well as :
nnoremap ; :


" autosave when focus is lost
au FocusLost * :wa


nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>a :Ack
inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


cmap w!! %!sudo tee > /dev/null %


