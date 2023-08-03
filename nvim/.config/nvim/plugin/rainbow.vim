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

