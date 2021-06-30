lua <<EOF
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = '> ',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                -- ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ef <cmd>Telescope find_files<cr>
nnoremap <leader>ew <cmd>Telescope live_grep<cr>
nnoremap <leader>eb <cmd>Telescope buffers<cr>
nnoremap <leader>eh <cmd>Telescope help_tags<cr>

nnoremap <leader>ev :lua require('local.telescope').search_dotfiles()<CR>

" git bindings
nnoremap <Leader>gb <cmd>Telescope git_branches<cr>
nnoremap <Leader>gl <cmd>Telescope git_commits<cr>
