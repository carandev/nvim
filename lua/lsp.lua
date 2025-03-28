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
  "prismals",
  "csharp_ls"
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers
})

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- 📌 "Go to Definition"
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

  -- 📌 "Go to Declaration"
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

  -- 📌 "Go to Implementation"
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

  -- 📌 "Go to Type Definition"
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

  -- 📌 "Show Hover (documentación)"
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  -- 📌 "Show Signature Help (info sobre funciones)"
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

  -- 📌 "Find References"
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

  -- 📌 "Rename Symbol"
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

  -- 📌 "Show Code Actions"
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  -- 📌 "Format Document"
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

for _, server in ipairs(servers) do
  if server == "biome" then
    lspconfig[server].setup({
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false }) -- Formateo antes de guardar
            end
          })
        end
      end
    })
  else
    lspconfig[server].setup({
      on_attach = on_attach
    })
  end
end

require("nvim-treesitter.configs").setup({
  ensure_installed = "all", -- O usa { "lua", "javascript", "php", "python", "c_sharp" }
  highlight = { enable = true },
  indent = { enable = true },
  auto_install = true, -- 🔥 Instala parsers automáticamente según el archivo abierto
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
