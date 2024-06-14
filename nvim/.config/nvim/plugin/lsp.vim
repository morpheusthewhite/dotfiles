lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>cn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<Leader>m', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<Leader>lr', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- signature
    require "lsp_signature".on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        hint_prefix = "⧠ ",
        handler_opts = {
            border = "rounded",
            }
    })
end

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {on_attach=on_attach}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
}
EOF

" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()
"
" let g:completion_matching_strategy = ['exact', 'substring', 'fuzzy']
" let g:completion_sorting = 'alphabet'

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" java lsp, i.e. nvim-jdtls
lua << EOF
-- -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
--
-- -- data directory setup
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = '/Users/francesco/.cache/jdtls' .. project_name

-- UNCOMMENT FOR JAVA SUPPORT
-- local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  -- cmd = {
  --   'java', -- or '/path/to/java11_or_newer/bin/java'
  --   '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  --   '-Dosgi.bundles.defaultStartLevel=4',
  --   '-Declipse.product=org.eclipse.jdt.ls.core.product',
  --   '-Dlog.protocol=true',
  --   '-Dlog.level=ALL',
  --   '-Xms1g',
  --   '--add-modules=ALL-SYSTEM',
  --   '--add-opens', 'java.base/java.util=ALL-UNNAMED',
  --   '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  --   '-jar', '/Users/francesco/.local/share/java/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
  --   '-configuration', '/Users/francesco/.local/share/java/config_mac',
  --   '-data', workspace_dir
  -- },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  -- root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

--   -- Here you can configure eclipse.jdt.ls specific settings
--   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--   -- for a list of options
--   settings = {
--     java = {
--         format = {
--             settings = {
--                 -- see https://github.com/mfussenegger/nvim-jdtls/issues/203
--                 -- url = '~/.jdtls/style.xml'
--             }
--         }
--     }
--   }
-- }
-- -- This starts a new client & server,
-- -- or attaches to an existing client & server depending on the `root_dir`.
-- require('jdtls').start_or_attach(config)

EOF
