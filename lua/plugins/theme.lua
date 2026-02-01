return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			vim.cmd('colorscheme onedark')
		end
	},
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "rebelot/kanagawa.nvim" },
	{ 'nyoom-engineering/oxocarbon.nvim' },
	{ "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000 }
}
