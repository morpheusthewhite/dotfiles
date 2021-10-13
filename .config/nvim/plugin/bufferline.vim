lua << EOF
require('bufferline').setup {
  options = {
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      return vim.fn.getbufinfo(buf_number)[1].hidden == 0
    end,
  }
}
EOF

nmap <silent>gt :BufferLineCycleNext<CR>
nmap <silent>gT :BufferLineCyclePrev<CR>

