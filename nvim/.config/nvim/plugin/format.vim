" by default, format files
" if !exists("do_format")
"     let do_format = 1
" endif
"
" augroup format
"     autocmd!
"     autocmd FileType markdown,tex,sh,rust,lua
"         \ if do_format
"             \ | execute 'au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry'
"         \ | endif
"     autocmd FileType vim,sh,python
"         \ if do_format
"             \ | execute 'set formatoptions-=tc'
"         \ | endif
"     autocmd FileType python
"         \ if do_format
"             \ | execute 'autocmd! BufWrite <buffer=abuf> :Black'
"         \ | endif
" augroup END
"
" " invoke automatic formatting from vim-autoformat
" noremap <F3> :Autoformat<CR>

