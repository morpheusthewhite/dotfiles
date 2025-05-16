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

require('go').setup()
-- require('go').setup()
-- local cfg = require'go.lsp'.config() -- config() return the go.nvim gopls setup
--
-- require('lspconfig').gopls.setup(cfg)

-- toggle between test file and non-test file
vim.api.nvim_create_user_command(
  'GoOpenTestToggle',
  function()
    local filepath = vim.fn.expand('%:p')
    local dir = vim.fn.expand('%:p:h')
    local filename = vim.fn.expand('%:t')
    
    if filename:match('_test%.go$') then
      -- Current file is a test file, switch to the non-test file
      local new_filename = filename:gsub('_test%.go$', '.go')
      vim.cmd('edit ' .. dir .. '/' .. new_filename)
    else
      -- Current file is not a test file, switch to the test file
      local new_filename = filename:gsub('%.go$', '_test.go')
      vim.cmd('edit ' .. dir .. '/' .. new_filename)
    end
  end,
  { nargs = 0 }
)
EOF

" mappings
nnoremap <leader>rt :GoTestFunc -v<CR> 
nnoremap <leader>rc :GoTestFile -v<CR>
nnoremap <leader>tt :GoOpenTestToggle<CR>

nnoremap <Leader>b :GoBreakToggle<CR>
nnoremap <Leader>d :GoDebug<CR>
