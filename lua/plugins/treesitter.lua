-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	-- dependencies = { "OXY2DEV/markview.nvim" },
-- 	build = ":TSUpdate",
-- 	lazy = false,
-- 	config = function()
-- 		require("nvim-treesitter.configs").setup {
-- 			ensure_installed = {
-- 				"rust",
-- 				"go",
-- 				"c",
-- 				"zig",
-- 				"javascript",
-- 				"typescript",
-- 				"lua",
-- 				"vim",
-- 				"vimdoc",
-- 				"query",
-- 				"markdown",
-- 				"markdown_inline",
-- 				"latex",
-- 				"typst",
-- 			},
-- 			sync_install = false,
-- 			auto_install = true,
-- 			highlight = { enable = true },
-- 		}
--
-- 		-- local markview = require("markview")
-- 		-- local presets = require("markview.presets")
-- 		--
-- 		-- markview.setup {
-- 		-- 	markdown = {
-- 		-- 		headings = presets.headings.glow,
-- 		-- 		horizontal_rules = presets.horizontal_rules.thin,
-- 		-- 		tables = presets.tables.rounded,
-- 		-- 		list_items = {
-- 		-- 			shift_width = function(_, _)
-- 		-- 				return 4
-- 		-- 			end,
-- 		-- 		},
-- 		-- 	},
-- 		-- 	modes = { "n", "c" },
-- 		-- 	hybrid_modes = { "n" },
-- 		-- 	callbacks = {
-- 		-- 		on_enable = function(_, win)
-- 		-- 			vim.wo[win].conceallevel = 2
-- 		-- 			vim.wo[win].concealcursor = "c"
-- 		-- 		end,
-- 		-- 	},
-- 		-- }
-- 		--
-- 		-- require("markview.extras.checkboxes").setup({
-- 		-- 	default = "X",
-- 		-- 	remove_style = "disable",
-- 		-- 	states = {
-- 		-- 		{ " ", "/", "X" },
-- 		-- 		{ "<", ">" },
-- 		-- 		{ "?", "!", "*" },
-- 		-- 		{ '"' },
-- 		-- 		{ "l", "b", "i" },
-- 		-- 		{ "S", "I" },
-- 		-- 		{ "p", "c" },
-- 		-- 		{ "f", "k", "w" },
-- 		-- 		{ "u", "d" },
-- 		-- 	},
-- 		-- })
-- 		-- require("markview.extras.headings").setup()
-- 		-- require("markview.extras.editor").setup()
-- 	end,
-- }
--
--

return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all"
			ensure_installed = {
				"vimdoc",
				"javascript",
				"typescript",
				"c",
				"lua",
				"rust",
				"jsdoc",
				"bash",
				"go",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
			auto_install = true,

			indent = {
				enable = true,
			},

			highlight = {
				-- `false` will disable the whole extension
				enable = true,
				disable = function(lang, buf)
					if lang == "html" then
						print("disabled")
						return true
					end

					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						vim.notify(
							"File larger than 100KB treesitter disabled for performance",
							vim.log.levels.WARN,
							{ title = "Treesitter" }
						)
						return true
					end
				end,
			},
		})
	end,
}
