return {
	"nvim-treesitter/nvim-treesitter",
	-- dependencies = { "OXY2DEV/markview.nvim" },
	build = ":TSUpdate",
	lazy = false,
	config = function()
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

		-- local markview = require("markview")
		-- local presets = require("markview.presets")
		--
		-- markview.setup {
		-- 	markdown = {
		-- 		headings = presets.headings.glow,
		-- 		horizontal_rules = presets.horizontal_rules.thin,
		-- 		tables = presets.tables.rounded,
		-- 		list_items = {
		-- 			shift_width = function(_, _)
		-- 				return 4
		-- 			end,
		-- 		},
		-- 	},
		-- 	modes = { "n", "c" },
		-- 	hybrid_modes = { "n" },
		-- 	callbacks = {
		-- 		on_enable = function(_, win)
		-- 			vim.wo[win].conceallevel = 2
		-- 			vim.wo[win].concealcursor = "c"
		-- 		end,
		-- 	},
		-- }
		--
		-- require("markview.extras.checkboxes").setup({
		-- 	default = "X",
		-- 	remove_style = "disable",
		-- 	states = {
		-- 		{ " ", "/", "X" },
		-- 		{ "<", ">" },
		-- 		{ "?", "!", "*" },
		-- 		{ '"' },
		-- 		{ "l", "b", "i" },
		-- 		{ "S", "I" },
		-- 		{ "p", "c" },
		-- 		{ "f", "k", "w" },
		-- 		{ "u", "d" },
		-- 	},
		-- })
		-- require("markview.extras.headings").setup()
		-- require("markview.extras.editor").setup()
	end,
}


