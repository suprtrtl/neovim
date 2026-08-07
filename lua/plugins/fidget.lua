vim.pack.add({
	'https://github.com/j-hui/fidget.nvim',
	'https://github.com/rcarriga/nvim-notify'
})
local fidget = require('fidget')

vim.notify = require('notify').setup({
	render = "compact",
})

fidget.setup({})
