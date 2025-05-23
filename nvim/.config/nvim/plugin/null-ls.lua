local none_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

none_ls.setup({
    sources = {
        -- none_ls.builtins.formatting.clang_format
        -- .with({
        --     extra_args = { "--style=file:~/.clang-format" },
        -- })
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format({async = false})
                end,
            })
        end
    end,
})
