lua <<EOF
-- nvim-treesitter `main` branch: only manages parsers/queries. Highlighting is
-- started per buffer with vim.treesitter.start(). Needs the `tree-sitter` CLI
-- (brew install tree-sitter-cli) to compile parsers.
local ok, ts = pcall(require, 'nvim-treesitter')
if not ok then
    return
end

ts.setup {}

-- Install anything missing (async, no-op when already installed)
ts.install {
    'bash', 'c', 'cpp', 'css', 'go', 'html', 'java', 'javascript', 'json',
    'kotlin', 'latex', 'lua', 'markdown', 'markdown_inline', 'python',
    'query', 'regex', 'rust', 'toml', 'typescript', 'vim', 'vimdoc', 'yaml',
}

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        -- silently skips filetypes without an installed parser
        pcall(vim.treesitter.start, args.buf)
    end,
})
EOF
