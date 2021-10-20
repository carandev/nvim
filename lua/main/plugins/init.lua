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

  use {'windwp/nvim-ts-autotag'}

  use {'windwp/nvim-autopairs'}

  use {'windwp/nvim-ts-rainbow'}

end)
