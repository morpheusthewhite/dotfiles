" Autocomplete set up

"
" YCM options and binding
"

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_confirm_extra_conf = 0

" trigger semantic completion after 3 chars have been written
let g:ycm_semantic_triggers = {
            \   'python': [ 're!\w{3}' ],
            \   'rust': [ 're!\w{3}' ],
            \   'latex': [ 're!\w{3}' ]
            \ }

let python_highlight_all=1
let g:pydocstring_formatter = 'google'

" appearance settings

" let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_sign_column="bg0"
colorscheme gruvbox

" Always transparent background
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn ctermbg=None guibg=None
" let g:airline_theme='gruvbox'

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
    au!
    au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
    au FileType tex set formatoptions+=t
    " autocompile shortcut
    " autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
augroup END


function! Synctex()
    " remove 'silent' for debugging
    execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-h>"

" Markdown preview plugin
" Plugin 'JamshedVesuna/vim-markdown-preview'
" let vim_markdown_preview_github=1 " GitHub styled markdown
" let vim_markdown_preview_browser='firefox'
" let vim_markdown_preview_use_xdg_open=1


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

" enable rainbox parentheses
" set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

let s:rainbow_conf = {
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       'tex': {
            \           'parentheses_options': 'containedin=texDocZone',
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/'],
            \       },
            \       'py': {
            \           'parentheses': ['start=/(/ step=/,/ end=/)/', 'start=/\[/ step=/,/ end=/\]/'],
            \       },
            \   }
            \}

augroup rainbow
    autocmd!
    autocmd VimEnter,BufReadPost * :RainbowToggleOn
augroup END

augroup format
    autocmd!
    autocmd BufWrite * :Autoformat
augroup END

" Grammarous settings
" let g:grammarous#show_first_error=0
" let g:grammarous#use_location_list=1


