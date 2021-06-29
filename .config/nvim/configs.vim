" let python_highlight_all=1
let g:pydocstring_formatter = 'google'

" fix line numbering
" launch the extension on an empty file
let g:vim_be_good_floating = 0

" Sort branches/tags by committer date. Minus sign to show in reverse order
" (recent first)
let g:fzf_checkout_git_options = '--sort=-committerdate'
" Use the bang command to checkout a tag
let g:fzf_tag_actions = {
            \ 'checkout': {'execute': '!{git} checkout {branch}'},
            \}
" Define a diff action using fugitive. You can use it with :GBranches diff or
"with :GBranches and pressing ctrl-f
let g:fzf_branch_actions = {
            \ 'diff': {
            \   'prompt': 'Diff> ',
            \   'execute': 'Git diff {branch}',
            \   'multiple': v:false,
            \   'keymap': 'ctrl-f',
            \   'required': ['branch'],
            \   'confirm': v:false,
            \ },
            \}
