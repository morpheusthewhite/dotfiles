call plug#begin('~/.vim/plugged')

" better fzf
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" git integration
Plug 'airblade/vim-gitgutter'

" git plugin
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Status line for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


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
" Plug 'dylanaraps/wal.vim'
" Plug 'deviantfero/wpgtk.vim'
" Plug 'dracula/vim', { 'name': 'dracula' }
" Plug 'gruvbox-community/gruvbox'
Plug 'rktjmp/lush.nvim', { 'branch': 'main' }
Plug 'npxbr/gruvbox.nvim', { 'branch': 'main' }

" syntax highlighting
Plug 'neomake/neomake'
" Plug 'vim-syntastic/syntastic'
" Plug 'nvie/vim-flake8'

" Enable smart folding for Python
" Plug 'tmhedberg/SimpylFold'

" python indenting
Plug 'vim-scripts/indentpython.vim'

" autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall', { 'branch': 'main' }
" Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'

Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

" csv viewer
Plug 'chrisbra/csv.vim'

" I hate matlab IDE
Plug 'daeyun/vim-matlab'

" proper indentation and formatting
Plug 'psf/black'
" Plug 'Chiel92/vim-autoformat'
Plug 'sbdchd/neoformat'

" grammar checks
Plug 'rhysd/vim-grammarous'

" party with vim text object <3
Plug 'kana/vim-textobj-user'
" really awesome stuff here
Plug 'kana/vim-textobj-line'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'sgur/vim-textobj-parameter'
Plug 'bps/vim-textobj-python'

" surround everything
Plug 'tpope/vim-surround'

" colored matching parentheses
Plug 'luochen1990/rainbow'

" Markdown preview in Glow. Not working in the 0.4.4. Install the nightly
" Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}

" brackets completion
Plug 'Raimondi/delimitMate'

" pydoc generation
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" " todo management
" Plug 'jceb/vim-orgmode'

" vim-plug
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" undotree
Plug 'mbbill/undotree'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

