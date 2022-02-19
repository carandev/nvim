require('keybindings')
require('main.options')
require('main.plugins')

require('bufferline-config')
require('lualine-config')
require('nvimtree-config')
require('treesitter-config')
require('autopairs-config')
require('lsp')
require('material-config')
require('colorizer-config')
require('kommentary-config')
require('dashboard-config')
require('blackline-config')
require('presence-config')

-- Color scheme
vim.g.material_style = "deep ocean"
vim.cmd('colorscheme material')
