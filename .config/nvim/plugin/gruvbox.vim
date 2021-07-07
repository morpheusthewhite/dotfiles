" appearance settings

" let g:gruvbox_termcolors=16
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_italic=1
" let g:gruvbox_sign_column="bg0"
" colorscheme gruvbox
set background=dark " or light if you want light mode
colorscheme gruvbox
    
" Always transparent background
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn ctermbg=None guibg=None
let g:airline_theme='base16_gruvbox_dark_hard'
