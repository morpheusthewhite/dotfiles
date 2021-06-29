augroup format
    autocmd!
    autocmd FileType markdown,vim,tex,sh,rust
                \ autocmd! BufWritePre <buffer=abuf> undojoin | Neoformat
    autocmd FileType vim,sh,python
                \ set formatoptions-=tc
    autocmd FileType python
                \ autocmd! BufWrite <buffer=abuf> :Black
augroup END

" invoke automatic formatting from vim-autoformat
noremap <F3> :Autoformat<CR>

