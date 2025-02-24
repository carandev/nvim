local servers = {
  "biome",
  "cssls",
  "html",
  "emmet_ls",
  "ruff",
  "lua_ls",
  "tailwindcss",
  "ts_ls",
  "intelephense",
  "prismals"
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers
})

local lspconfig = require("lspconfig")

for _, server in ipairs(servers) do
    if server == "biome" then
      lspconfig[server].setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })  -- Formateo antes de guardar
                end
            })
        end
    end
})
  else
    lspconfig[server].setup({})
    end
end

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

