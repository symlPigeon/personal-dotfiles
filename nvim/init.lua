-- basic configure
require('basic')
-- hotkey map
require('keybindings')
-- plugins
require('plugins')
-- theme
require('colorscheme')

-- plugins
-- NvimTree
require('plugin-config.nvim-tree')
-- bufferline
require('plugin-config.bufferline')
-- lualine
require('plugin-config.lualine')
-- telescope
require('plugin-config.telescope')
-- dashboard
require('plugin-config.dashboard')
-- telescope projects extensions
require('plugin-config.project')
-- treesitter
require('plugin-config.nvim-treesitter')
-- lsp
require('lsp.setup')
require('lsp.cmp')
-- ui enhance
require('lsp.ui')
require('plugin-config.indent-blankline')
-- github copilot
require('plugin-config.copilot')
-- winbar
require('plugin-config.incline')
-- null-ls
require('lsp.null-ls')
-- fidget
require('plugin-config.fidget')
-- gitsigns
require('plugin-config.gitsigns')
-- surround
require('plugin-config.surround')
-- comment
require('plugin-config.comment')
