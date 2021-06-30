" ----------
" latex setup
" ----------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

let g:tex_conceal='abdmg'

augroup tex
    au!
    " au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
    au FileType tex set formatoptions+=t
    " autocompile shortcut
    " autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
augroup END

function! Synctex()
    " remove 'silent' for debugging
    execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction

nnoremap <C-enter> :call Synctex()<cr>

