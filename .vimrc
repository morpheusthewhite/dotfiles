set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

" Enable smart folding
Plugin 'tmhedberg/SimpylFold'

au BufNewFile,BufRead *.py,*.cpp,*.c,*.h
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

Plugin 'vim-scripts/indentpython.vim'

" highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Bundle 'Valloric/YouCompleteMe'

" Autocomplete set up
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

" Plugin 'jnurmine/Zenburn'

" :colorscheme Zenburn
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" various settings for powerline
set rtp+=$HOME/.local/lib/python3.5/site-packages/powerline/bindings/vim/                                                                                 
set laststatus=2
set t_Co=256

set nu
hi Normal guibg=NONE ctermbg=NONE

" ----------
" latex setup
" ----------
Plugin 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Snippets installation
Plugin 'honza/vim-snippets'
Plugin 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" function! Synctex()
" 	" remove 'silent' for debugging
" 	execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
" endfunction

" map <C-enter> :call Synctex()<cr>

" autocompile shortcut
" autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>

Plugin 'vim-scripts/vim-auto-save'
