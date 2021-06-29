"
" YCM options and binding
"

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_confirm_extra_conf = 0
" use always the system-wide python for ycm
" let g:ycm_path_to_python_interpreter = '/usr/bin/python'
" and for pynvim as well
" let g:python3_host_prog='/usr/bin/python'

" trigger semantic completion after 3 chars have been written
let g:ycm_semantic_triggers = {
            \   'python': [ 're!\w{3}' ],
            \   'rust': [ 're!\w{3}' ],
            \   'latex': [ 're!\w{3}' ]
            \ }

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif

nnoremap <Leader>cd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>cp :YcmCompleter GoToReferences<CR>
nnoremap <Leader>cf :YcmCompleter FixIt<CR>
nnoremap <Leader>cr :YcmCompleter RefactorRename<Space>
nnoremap <Leader>c= :YcmCompleter Format<CR>
nnoremap <Leader>cd :YcmCompleter GetDoc<CR>
nnoremap <Leader>ct :YcmCompleter GoToDefinition<CR>

