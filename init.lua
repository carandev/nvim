require("config")

vim.cmd.colorscheme "catppuccin-mocha"
vim.opt.clipboard = "unnamedplus"  -- Usa el portapapeles del sistema
vim.opt.showtabline = 2  -- Siempre mostrar la barra de pestañas
vim.opt.expandtab = true   -- Usa espacios en lugar de tabulaciones
vim.opt.shiftwidth = 2     -- Tamaño de la indentación
vim.opt.tabstop = 2        -- Número de espacios por tab
vim.opt.softtabstop = 2    -- Ajusta el espacio en la edición
vim.opt.smartindent = true -- Auto-indenta según el contexto
vim.g.mapleader = " "  -- Define "Space" como la tecla líder

vim.keymap.set("n", "<S-L>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-H>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-A-w>", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gg", ":<cmd>LazyGit<CR>", { noremap = true, silent = true })
