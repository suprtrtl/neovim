vim.pack.add('folke/snacks.nvim')

snacks = require('snacks')

snacks.setup({
	bigfile = { enabled = true },
	dashboard = { enabled = true },
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
