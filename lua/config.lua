vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
	"neovim/nvim-lspconfig",  -- Configuración de LSP
	"williamboman/mason.nvim",  -- Instalador de servidores LSP
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp",        -- Autocompletado
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"L3MON4D3/LuaSnip",       -- Snippets
	"saadparwaiz1/cmp_luasnip",
	"nvim-treesitter/nvim-treesitter", -- Resaltado de sintaxis avanzado
	"nvim-tree/nvim-tree.lua",         -- Explorador de archivos
	"nvim-tree/nvim-web-devicons",
	"lewis6991/gitsigns.nvim",         -- Indicadores de cambios en git
	"tpope/vim-fugitive",              -- Comandos git dentro de Neovim
	"zbirenbaum/copilot.lua",
	"lukas-reineke/indent-blankline.nvim", -- Guías de indentación
	{ 
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000 
	},
	{
	    "nvim-telescope/telescope.nvim",
	    dependencies = { "nvim-lua/plenary.nvim" },
	    config = function()
		local telescope = require("telescope")
		telescope.setup({})
		vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })  -- Buscar archivos
		vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>", { noremap = true, silent = true })   -- Buscar en contenido
	    end
	},
  {
      "kdheepak/lazygit.nvim",
      lazy = true,
      cmd = {
          "LazyGit",
          "LazyGitConfig",
          "LazyGitCurrentFile",
          "LazyGitFilter",
          "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
          "nvim-lua/plenary.nvim",
      },
  },
{
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup({})
    end
},
{
    "kosayoda/nvim-lightbulb",
    config = function()
        require("nvim-lightbulb").setup({
            autocmd = { enabled = true }
        })
    end
},
{ 'echasnovski/mini.nvim', version = '*' }
})

require("lsp")
