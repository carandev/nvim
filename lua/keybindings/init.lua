vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true, silent = false})
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true, silent = false})
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true, silent = false})
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true, silent = false})
map('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<leader>k', ':bd!<CR>', {noremap = true, silent = true})
map('t', '<esc>', '<C-\\><C-N>', {noremap = true, silent = true})
map('n', '<f12>', ':ToggleTerm<cr>', {noremap = true, silent = true})
map('n', '<leader>x', ':x<cr>', {noremap = true, silent = true})
map('n', '<leader>w', ':w<cr>', {noremap = true, silent = true})
map('n', '<leader>fm', ':RustFmt<cr>', {noremap = true, silent = true})
