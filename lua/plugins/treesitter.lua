vim.pack.add('https://github.com/nvim-treesitter/nvim-treesitter')

require("nvim-treesitter").setup {
	ensure_installed = {
		"rust",
		"go",
		"c",
		"zig",
		"javascript",
		"typescript",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
		"latex",
		"typst",
		"odin",
	},
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
}

vim.cmd('TSUpdate')
