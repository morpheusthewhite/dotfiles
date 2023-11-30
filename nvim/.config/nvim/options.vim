" Enable folding
set foldmethod=indent
set foldlevel=4

" execute the .vimrc if present in the current dir
set exrc

" create a coherent and good indentation level over all files
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=0
set expandtab
set autoindent
set fileformat=unix

" search options
set incsearch
set nohlsearch
set smartcase
set ignorecase

" open a new window at the bottom
set splitbelow

" turn relative line numbers on
set number relativenumber
set splitright

" fix encoding
set encoding=utf-8

" avoid auto insert of newlines for non tex files
set formatoptions-=tc

" protips
let mapleader=" "

syntax on
" enable avdl syntax highlighting
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl

" set status line transparent
set laststatus=2

" enable 256 colors support directly in vim
set termguicolors

set scrolloff=1
set sidescrolloff=2

" set how much to show in latex
set conceallevel=1

" sane completion
set completeopt=menuone,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" needed by toggleterm
set hidden

set nofixendofline

" disable mouse support
set mouse=
