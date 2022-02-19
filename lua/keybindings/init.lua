vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true, silent = false})
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true, silent = false})
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true, silent = false})
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true, silent = false})
map('n', '<leader>b', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<leader>k', ':bd!<CR>', {noremap = true, silent = true})
map('t', '<esc>', '<C-\\><C-N>', {noremap = true, silent = true})
map('n', '<f12>', ':ToggleTerm<cr>', {noremap = true, silent = true})
map('n', '<leader>x', ':xa<cr>', {noremap = true, silent = true})
map('n', '<leader>w', ':w<cr>', {noremap = true, silent = true})
map('n', '<leader>fm', ':RustFmt<cr>', {noremap = true, silent = true})

map('n', '<leader>lk', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {noremap = true, silent = true})
map('n', '<leader>lK', '<cmd>Lspsaga hover_doc<cr>', {noremap = true, silent = true})
map('n', '<leader>lw', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', {noremap = true, silent = true})
map('n', '<leader>lW', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', {noremap = true, silent = true})
map('n', '<leader>ll', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', {noremap = true, silent = true})
map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {noremap = true, silent = true})
map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', {noremap = true, silent = true})
map('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {noremap = true, silent = true})
map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', {noremap = true, silent = true})
map("n", "<leader>lR", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
map('n', '<leader>la', '<cmd>Lspsaga code_action<cr>', {noremap = true, silent = true})
map('n', '<leader>le', '<cmd>Lspsaga show_line_diagnostics<cr>', {noremap = true, silent = true})
map('n', '<leader>ln', '<cmd>Lspsaga diagnostic_jump_next<cr>', {noremap = true, silent = true})
map('n', '<leader>lN', '<cmd>Lspsaga diagnostic_jump_prev<cr>', {noremap = true, silent = true})

map("x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {silent = true, noremap = true})
map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {silent = true, noremap = true})
