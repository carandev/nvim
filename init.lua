require('keybindings')
require('main.options')
require('main.plugins')

require('bufferline-config')
require('lualine-config')
require('nvimtree-config')
require('treesitter-config')
require('autopairs-config')
require('lsp')
require('colorizer-config')
require('autosave-config')
require('kommentary-config')

-- Color scheme
vim.g.material_style = "palenight"
vim.cmd('colorscheme material')
