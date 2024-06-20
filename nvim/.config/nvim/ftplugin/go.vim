" nvim-go setup
lua <<EOF
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

-- require('go').setup()
require('go').setup()
local cfg = require'go.lsp'.config() -- config() return the go.nvim gopls setup

require('lspconfig').gopls.setup(cfg)
EOF

" mappings
nnoremap <leader>rt :GoTestFunc -v<CR> 
nnoremap <leader>rc :GoTestFile -v<CR>
