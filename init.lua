require('opts')
require('autocommand')
require('lsp')
require('snip')

vim.pack.add({
	'https://github.com/olimorris/onedarkpro.nvim',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/echasnovski/mini.nvim',
	'https://github.com/folke/snacks.nvim',
	'https://github.com/mbbill/undotree',
	'https://github.com/nvim-lualine/lualine.nvim',
	'https://github.com/MunifTanjim/nui.nvim',
	'https://github.com/folke/noice.nvim',
	'https://github.com/OXY2DEV/markview.nvim',
})

require('remap')

vim.cmd('colorscheme onedark')
require("nvim-treesitter.install").update({ with_sync = true })()

require('plugins.init')


