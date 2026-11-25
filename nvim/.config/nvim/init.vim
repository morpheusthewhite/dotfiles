filetype plugin on

" use a fixed python with pynvim, independent of PATH / active venvs
let g:python3_host_prog = expand('~/.local/share/nvim/py/bin/python')

" plugin loading
source ~/.config/nvim/plugins.vim

" native vim options
source ~/.config/nvim/options.vim

" mappings
source ~/.config/nvim/mappings.vim
