" Enable folding with -
" nnoremap - za

" run current file with python
nnoremap <Leader>r :! python <C-R>%<CR>

nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>tt :terminal<CR>
nnoremap <Leader>tv :vsplit<CR>:terminal<CR>
nnoremap <Leader>th :split<CR>:terminal<CR>

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
nnoremap <Backspace> ^

nnoremap <Leader>wh :split
nnoremap <Leader>wv :vsplit

"split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" convenient pasting from primary register
" noremap <C-d> "+d
nnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-y> "+y
vnoremap <C-p> "+p

" easier tabulation
" vnoremap t >gv
" vnoremap r <gv

" faster replace in v mode
vnoremap s "hy:%s/<C-r>h//gc<left><left><left>

" remove trailing whitespace
nnoremap <Leader>tr :%s/\s\+$//e<CR>

" nnoremap <Leader>wp :Glow<CR>
nnoremap zh <C-w>h
nnoremap zl <C-w>l
nnoremap zj <C-w>j
nnoremap zk <C-w>k

nnoremap <Leader>as :AutoSaveToggle<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
" https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_lines
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" make terminal mode Esc key great again
" tnoremap <Esc> <C-\><C-n>

" greatest remap ever, thanks @primagen
vnoremap <leader>p "_dP

" from vim-sensible
" https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim

" Use <C-S> to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-S> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" move to beginning and end of visual selection
noremap g> `>
noremap g< `<

" navigate location list
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprev<CR>
nnoremap <Leader>ll :llist<CR>

" undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" thanks, again, ThePrimeagen
" https://www.youtube.com/channel/UC8ENHE5xdFSwx71u3fDH5Xw
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
