set termguicolors " this variable must be enabled for colors to be applied properly

nnoremap <Leader>et :NvimTreeToggle<CR>
nnoremap <Leader>el :NvimTreeFindFile<CR>

" default will show icon by default if no icon is provided
" default shows no icon by default
lua<<EOF
require'nvim-tree'.setup {
  disable_netrw      = true,
  hijack_netrw       = true,
  open_on_tab        = false,
  hijack_cursor      = true,
  update_cwd         = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "?",
      info = "?",
      warning = "?",
      error = "?",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {".cache", "node_modules"}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    git_ignored = false,
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    -- height = 30,
    side = 'left',
    relativenumber = true,
  }
}
EOF
