lua <<EOF2
local ok, review = pcall(require, "review")
if ok then review.setup({}) end
EOF2

nnoremap <leader>rr <cmd>Review<cr>
nnoremap <leader>rm <cmd>Review commits<cr>
nnoremap <leader>rb <cmd>Review branch<cr>
nnoremap <leader>rn :Review note<cr>
vnoremap <leader>rn :Review note<cr>
nnoremap <leader>re <cmd>Review edit<cr>
nnoremap <leader>rd <cmd>Review delete<cr>
nnoremap <leader>rx <cmd>Review export<cr>
