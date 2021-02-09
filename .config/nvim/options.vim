" Enable folding
set foldmethod=indent
set foldlevel=2

" create a coherent and good indentation level over all files
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
set incsearch
set smartcase
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
let mapleader="-"

syntax on

" set status line transparent
set laststatus=2

" enable 256 colors support directly in vim
set termguicolors

set scrolloff=1
set sidescrolloff=2
