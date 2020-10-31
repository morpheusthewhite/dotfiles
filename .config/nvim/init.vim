set nocompatible              " required
set smartcase
filetype off                  " required

call plug#begin('~/.vim/plugged')

" fzf for file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" git integration
Plug 'airblade/vim-gitgutter'

" git plugin 
Plug 'tpope/vim-fugitive'

" Status line for vim
Plug 'vim-airline/vim-airline'

" for comments
Plug 'scrooloose/nerdcommenter'

" fs explorer
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" auto save
Plug 'vim-scripts/vim-auto-save'

" Snippets installation
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'

" latex editing
Plug 'lervag/vimtex'

" colorschemes
" Plugin 'challenger-deep-theme/vim', {'name': 'challenger-deep-theme'}
Plug 'dylanaraps/wal.vim'
" Plug 'deviantfero/wpgtk.vim'
" Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'morhetz/gruvbox'

" syntax highlighting
Plug 'neomake/neomake'
"Plug 'vim-syntastic/syntastic'
"Plug 'nvie/vim-flake8'

" Enable smart folding
Plug 'tmhedberg/SimpylFold'

" python indenting
Plug 'vim-scripts/indentpython.vim'

" autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'neoclide/coc.nvim'

Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

" csv viewer
Plug 'chrisbra/csv.vim'

" I hate matlab IDE
Plug 'daeyun/vim-matlab'
call plug#end()

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"au BufNewFile,BufRead *.py,*.cpp,*.c,*.h
    "\ set tabstop=4
    "\| set softtabstop=4
    "\| set shiftwidth=4
    "\| set textwidth=79
    "\| set expandtab
    "\| set autoindent
    "\| set fileformat=unix

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
" mapping toggle
map <Leader>r :set number! relativenumber!<CR>

" highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" fix encoding
set encoding=utf-8

" Autocomplete set up

" YCM stuff
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" trigger semantic completion after 2 chars have been written
let g:ycm_semantic_triggers = {
    \   'python': [ 're!\w{3}' ],
    \   'rust': [ 're!\w{3}' ]
    \ }


let python_highlight_all=1
syntax on

" Always transparent background
hi Normal guibg=NONE ctermbg=NONE

" colorscheme choice
"colorscheme wal

" enable 256 colors support directly in vim
set termguicolors

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
let g:gruvbox_invert_selection='0'
autocmd vimenter * colorscheme gruvbox
"colorscheme wpgtkAlt
"colorscheme dracula

" ----------
" latex setup
" ----------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-h>"

"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

function! Synctex()
	" remove 'silent' for debugging
 	execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction

map <C-enter> :call Synctex()<cr>

" autocompile shortcut
autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>


map <C-a> :AutoSaveToggle<CR>

" Markdown preview plugin
" Plugin 'JamshedVesuna/vim-markdown-preview'
" let vim_markdown_preview_github=1 " GitHub styled markdown
" let vim_markdown_preview_browser='firefox'
" let vim_markdown_preview_use_xdg_open=1


" Nerdtree-tabs setup
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" avoid auto insert of newlines
set formatoptions-=tc

" fzf related shortcuts (credits theprimeagen)
nnoremap <Leader>pf :Files<CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
" https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_linesnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" fix line numbering
" launch the extension on an empty file
let g:vim_be_good_floating = 0

" Full config for syntax check: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)

" nerd commenting
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" greatest remap ever, thanks @primagen
vnoremap <leader>p "_dP
