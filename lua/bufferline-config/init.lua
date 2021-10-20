require("bufferline").setup{}

vim.cmd('nnoremap <silent><tab> :BufferLineCycleNext<CR>')
vim.cmd('nnoremap <silent><s-tab> :BufferLineCyclePrev<CR>')
