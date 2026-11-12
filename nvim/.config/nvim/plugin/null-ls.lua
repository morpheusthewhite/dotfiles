local none_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

none_ls.setup({
    sources = {
        -- none_ls.builtins.formatting.clang_format
        -- .with({
        --     extra_args = { "--style=file:~/.clang-format" },
        -- })

        none_ls.builtins.diagnostics.ktlint,
    },
    on_attach = function(client, bufnr)
        if client:supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- only format through none-ls, so other servers
                    -- (e.g. kotlin_lsp) don't format the buffer as well
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        async = false,
                        filter = function(c) return c.name == "null-ls" end,
                    })
                end,
            })
        end
    end,
})
