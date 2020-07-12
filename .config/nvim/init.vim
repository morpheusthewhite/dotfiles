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
" Plug 'morhetz/gruvbox'

" syntax highlighting
" Plug 'vim-syntastic/syntastic'
" Plug 'nvie/vim-flake8'

" Enable smart folding
Plug 'tmhedberg/SimpylFold'

" python indenting
Plug 'vim-scripts/indentpython.vim'

" autocompletion
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim'

Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

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
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_key_list_stop_completion = ['<C-y>']
"let g:ycm_key_invoke_completion = '<C-Space>'
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on

" Always transparent background
hi Normal guibg=NONE ctermbg=NONE

" colorscheme choice
colorscheme wal
"autocmd vimenter * colorscheme gruvbox
"colorscheme gruvbox
"colorscheme wpgtkAlt
"colorscheme dracula

" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" various settings for powerline
" set rtp+=$HOME/.local/lib/python3.5/site-packages/powerline/bindings/vim/                                                                                 
" set laststatus=2
" set t_Co=256

" set nu
" hi Normal guibg=NONE ctermbg=NONE

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

" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

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

" All coc stuff

" Give more space for displaying messages.
set cmdheight=2

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
" https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_linesnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
