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
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code Action" })

vim.keymap.set("n", "<A-j>", function()
    require("mini.multi").add_under_cursor()
end, { noremap = true, silent = true, desc = "Añadir cursor a siguiente ocurrencia" })

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json" },
    callback = function()
        vim.lsp.buf.format({
            async = false,
            filter = function(client)
                return client.name == "biome"  -- Solo usa Biome para formatear
            end
        })
    end
})
