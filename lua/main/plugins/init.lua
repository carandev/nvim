return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'shaunsingh/nord.nvim'

  -- Highlighting
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use 'windwp/nvim-ts-autotag'

  use 'windwp/nvim-autopairs'

  use 'p00f/nvim-ts-rainbow'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind-nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'akinsho/toggleterm.nvim'
  use 'b3nj5m1n/kommentary'
  use 'marko-cerovac/material.nvim'
  use 'github/copilot.vim'
  use 'glepnir/dashboard-nvim'
  use 'rust-lang/rust.vim'
  use 'mfussenegger/nvim-jdtls'
  use "lukas-reineke/indent-blankline.nvim"
  use { 'tami5/lspsaga.nvim' }
  use 'andweeb/presence.nvim'

  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = {'~/', '~/Projects'}
      }
    end
  }

  use('MunifTanjim/prettier.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
end)
