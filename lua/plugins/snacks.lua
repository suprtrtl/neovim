vim.pack.add({'https://github.com/folke/snacks.nvim'})

local snacks = require('snacks')

snacks.setup({
	bigfile = { enabled = true },
	explorer = { enabled = false },
	indent = { enabled = true },
	image = {
		enabled = true,
		doc = {
			inline = false
		},
	},
	input = { enabled = true },
	picker = { enabled = false },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = false },
	statuscolumn = { enabled = true },
	terminal = { enabled = true },
	words = { enabled = true },
})
