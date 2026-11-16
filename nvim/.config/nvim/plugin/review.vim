lua <<EOF2
local ok, review = pcall(require, "review")
if ok then
  -- Only one kind of comment: everything is a "note" (the default type).
  -- The type picker in the popup is hardcoded to four types upstream, so
  -- disable cycling and the per-type keymaps instead.
  review.setup({
    keymaps = {
      add_suggestion = false,
      add_issue = false,
      add_praise = false,
      popup_cycle_type = false,
    },
    export = {
      header = "Review comments, please address them. Lines prefixed with ~ refer to the old side of the diff.",
    },
  })
end
EOF2

nnoremap <leader>rr <cmd>Review<cr>
nnoremap <leader>rm <cmd>Review commits<cr>
nnoremap <leader>rb <cmd>Review branch<cr>
nnoremap <leader>rn :Review note<cr>
vnoremap <leader>rn :Review note<cr>
nnoremap <leader>re <cmd>Review edit<cr>
nnoremap <leader>rd <cmd>Review delete<cr>
nnoremap <leader>rx <cmd>Review export<cr>
nnoremap <leader>rl <cmd>Review clear<cr>
