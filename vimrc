
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'    " let Vundle manage Vundle, required
Plugin 'bling/vim-airline'
Plugin 'altercation/solarized'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" installing tweaks from 'http://stevelosh.com/blog/2010/09/coming-home-to-vim/#pathogen'
filetype off
filetype plugin indent on


" let g:solarized_termcolors=256

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
" syntax on
syntax enable
" set background=dark
" colorscheme solarized


set modelines=0
set ai


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


