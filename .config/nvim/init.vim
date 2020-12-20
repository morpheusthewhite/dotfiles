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
" Plug 'vim-syntastic/syntastic'
" Plug 'nvie/vim-flake8'

" Enable smart folding for Python
" Plug 'tmhedberg/SimpylFold'

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

" proper indentation
Plug 'Chiel92/vim-autoformat'

" grammar checks
Plug 'rhysd/vim-grammarous'

" line object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'

" surround everything
Plug 'tpope/vim-surround'

" colored matching parentheses
Plug 'luochen1990/rainbow'
call plug#end()

" Enable folding
set foldmethod=indent
set foldlevel=2

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

" highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" fix encoding
set encoding=utf-8

" Autocomplete set up

"
" YCM options and binding
"

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'

nnoremap <Leader>cd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>cp :YcmCompleter GoToReferences<CR>
nnoremap <Leader>cf :YcmCompleter FixIt<CR>
nnoremap <Leader>cr :YcmCompleter RefactorRename<Space> 
nnoremap <Leader>c= :YcmCompleter Format<CR>
nnoremap <Leader>cd :YcmCompleter GetDoc<CR>
nnoremap <Leader>ct :YcmCompleter GoToDefinition<CR>

" trigger semantic completion after 3 chars have been written
let g:ycm_semantic_triggers = {
    \   'python': [ 're!\w{3}' ],
    \   'rust': [ 're!\w{3}' ],
    \   'latex': [ 're!\w{3}' ]
    \ }


let python_highlight_all=1
syntax on

" Always transparent background
hi Normal guibg=NONE ctermbg=NONE

" colorscheme choice
"colorscheme wal

" enable 256 colors support directly in vim
set termguicolors
let g:gruvbox_termcolors=16

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
let g:gruvbox_invert_selection='0'
augroup cscheme
    autocmd!
    autocmd vimenter * colorscheme gruvbox
augroup END
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

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif

augroup tex
    au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
    " autocompile shortcut
    " autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
augroup END


function! Synctex()
	" remove 'silent' for debugging
 	execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction

nnoremap <C-enter> :call Synctex()<cr>

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-h>"

nnoremap <C-a> :AutoSaveToggle<CR>

" Markdown preview plugin
" Plugin 'JamshedVesuna/vim-markdown-preview'
" let vim_markdown_preview_github=1 " GitHub styled markdown
" let vim_markdown_preview_browser='firefox'
" let vim_markdown_preview_use_xdg_open=1


" Nerdtree-tabs setup
nnoremap <Leader>ee <plug>NERDTreeTabsToggle<CR>

" avoid auto insert of newlines
set formatoptions-=c

" fzf related shortcuts (credits theprimeagen)
nnoremap <Leader>pf :Files<CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
" https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_lines
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" make terminal mode Esc key great again
tnoremap <Esc> <C-\><C-n>

" fix line numbering
" launch the extension on an empty file
let g:vim_be_good_floating = 0

" Full config for syntax check: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)

"
" nerd commenter
"

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

" from vim-sensible 
" https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim

" Use <C-S> to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-S> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

set scrolloff=1
set sidescrolloff=2

" enable rainbox parentheses
" set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1 

let s:rainbow_conf = {
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'tex': {
\			'parentheses_options': 'containedin=texDocZone',
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/'],
\		},
\		'py': {
\			'parentheses': ['start=/(/ step=/,/ end=/)/', 'start=/\[/ step=/,/ end=/\]/'],
\		},
\   }
\}

augroup rainbow
    autocmd!
    autocmd VimEnter,BufReadPost * :RainbowToggleOn
augroup END


" invoke automatic formatting from vim-autoformat
noremap <F3> :Autoformat<CR>

" run current file with python
nnoremap <Leader>r :! python <C-R>%<CR>

nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>tt :terminal<CR> 

" Not sure if I want this, since it will not be available in other editors with
" vim bindings
" inoremap jk <Esc>

" forget about arrows
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>sw :w<CR>

nnoremap <A-p> gqip
nnoremap <Backspace> d^

nnoremap <Leader>wh :split 
nnoremap <Leader>wv :vsplit 

"split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

