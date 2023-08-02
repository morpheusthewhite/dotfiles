set termguicolors " this variable must be enabled for colors to be applied properly

nnoremap <Leader>et :NvimTreeToggle<CR>
nnoremap <Leader>el :NvimTreeFindFile<CR>

" default will show icon by default if no icon is provided
" default shows no icon by default
lua<<EOF
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
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
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    -- height = 30,
    hide_root_folder = false,
    side = 'left',
    relativenumber = true,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}
EOF
