require("mason").setup()
require("mason-lspconfig").setup({})

local lspconfig = require("lspconfig")

require("nvim-treesitter.configs").setup({
            ensure_installed = "all", -- O usa { "lua", "javascript", "php", "python", "c_sharp" }
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,  -- 🔥 Instala parsers automáticamente según el archivo abierto
        })

require("nvim-tree").setup()
require("copilot").setup()

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
})

