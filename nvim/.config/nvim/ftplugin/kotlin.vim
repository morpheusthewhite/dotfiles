lua <<EOF
-- toggle between test file and non-test file
-- src/main/kotlin/.../Foo.kt <-> src/test/kotlin/.../FooTest.kt
vim.api.nvim_create_user_command(
  'KotlinOpenTestToggle',
  function()
    local path = vim.fn.expand('%:p')
    local target

    if path:match('Test%.kt$') then
      target = path:gsub('/src/test/', '/src/main/'):gsub('Test%.kt$', '.kt')
    else
      target = path:gsub('/src/main/', '/src/test/'):gsub('%.kt$', 'Test.kt')
    end

    if target == path then
      vim.notify('Not under src/main or src/test', vim.log.levels.WARN)
      return
    end
    vim.fn.mkdir(vim.fn.fnamemodify(target, ':h'), 'p')
    vim.cmd('edit ' .. vim.fn.fnameescape(target))
  end,
  { nargs = 0 }
)

-- Run the tests of the current file's class using Gradle, scoped to the
-- file's own module (a plain `test --tests X` fails in modules without X).
vim.api.nvim_create_user_command('GradleTestFile', function()
    local path = vim.fn.expand('%:p')
    local root = vim.fs.root(path, { 'settings.gradle.kts', 'settings.gradle' })
    if not root or vim.fn.executable(root .. '/gradlew') == 0 then
        vim.notify('No Gradle wrapper found for this file', vim.log.levels.ERROR)
        return
    end

    -- module = nearest ancestor with a build file, as a Gradle project path
    local module_dir = vim.fs.root(path, { 'build.gradle.kts', 'build.gradle' }) or root
    local task = 'test'
    if module_dir ~= root then
        task = ':' .. module_dir:sub(#root + 2):gsub('/', ':') .. ':test'
    end

    -- fully qualified class name from the package line, wildcard if missing
    local class = vim.fn.expand('%:t:r'):gsub('Test$', '') .. 'Test'
    local pkg
    for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, 30, false)) do
        pkg = line:match('^package%s+([%w_.]+)')
        if pkg then break end
    end
    local filter = pkg and (pkg .. '.' .. class) or ('*' .. class)

    vim.cmd('!cd ' .. vim.fn.shellescape(root) .. ' && ./gradlew '
        .. vim.fn.shellescape(task) .. ' --tests ' .. vim.fn.shellescape(filter))
end, { nargs = 0 })
EOF

" mappings
nnoremap <buffer> <leader>rc :GradleTestFile<CR>
nnoremap <buffer> <leader>tt :KotlinOpenTestToggle<CR>
