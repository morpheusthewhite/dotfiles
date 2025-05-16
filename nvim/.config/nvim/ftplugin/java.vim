lua <<EOF
-- toggle between test file and non-test file
vim.api.nvim_create_user_command(
  'JavaOpenTestToggle',
  function()
    local filepath = vim.fn.expand('%:p')
    local dir = vim.fn.expand('%:p:h')
    local filename = vim.fn.expand('%:t')
    
    if filename:match('Test%.java$') then
      -- Current file is a test file, switch to the non-test file
      local new_filename = filename:gsub('Test%.java$', '.java')
      vim.cmd('edit ' .. dir .. '/' .. new_filename)
    else
      -- Current file is not a test file, switch to the test file
      local new_filename = filename:gsub('%.java$', 'Test.java')
      vim.cmd('edit ' .. dir .. '/' .. new_filename)
    end
  end,
  { nargs = 0 }
)

-- Command to run tests in the current file using Gradle
vim.api.nvim_create_user_command('GradleTestFile', function()
    local filepath = vim.fn.expand('%:p') -- Get the current file's absolute path
    local test_name = vim.fn.expand('%:t:r') -- Get the current file's name without extension
    vim.cmd('!./gradlew test --tests ' .. test_name)
end, { nargs = 0 })

-- vim.api.nvim_create_user_command(
--   'GoTestFunc',
--   ,
--   { nargs = 0 }
-- )
-- 
EOF

" mappings
nnoremap <leader>rt :GoTestFunc -v<CR> 
nnoremap <leader>rc :GoTestFile -v<CR>
nnoremap <leader>tt :JavaOpenTestToggle<CR>

nnoremap <Leader>b :GoBreakToggle<CR>
nnoremap <Leader>d :GoDebug<CR>
