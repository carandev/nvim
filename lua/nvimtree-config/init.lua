require'nvim-tree'.setup {
  view = {
    side = 'right'
  }
}

vim.cmd('nnoremap <c-b> :NvimTreeToggle<CR>')
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_refresh_wait = 500
vim.g.nvim_tree_gitignore = 1
