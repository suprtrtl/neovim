vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.wrap = false

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 50

vim.o.termguicolors = true

vim.o.mouse = 'a'

vim.o.concealcursor = "n"

vim.diagnostic.enable = true
vim.diagnostic.config {
	virtual_text = {
		prefix = "●",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
			[vim.diagnostic.severity.INFO] = "󰋼 ",
		},
	},
}
