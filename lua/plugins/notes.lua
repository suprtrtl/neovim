local obsidian_vaults = {
	{
		name = "personal",
		path = "~/notes/personal",
	},

	{
		name = "project-zero",
		path = "~/notes/worldbuilding/project-zero"
	}

}


return {

	-- Markdown

	-- Markview config in `treesitter.lua`
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && yarn install",
		config = function()
			vim.g.mkdp_markdown_css = vim.fn.expand('~/.config/markdown-style/markdown.css')
			vim.g.mkdp_highlight_css = vim.fn.expand('~/.config/markdown-style/highlight.css')
		end
	},

	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = obsidian_vaults,

			daily_notes = {
				folder = "06-daily/2025",
				defualt_tags = { "daily" },
			},

			templates = {
				folder = "99-meta/templates",
				-- substitutions = {
				-- 	name = function ()
				-- 		if note.title then
				-- 			return note.title
				-- 		else
				-- 			return "temp name"
				-- 		end
				-- 	end,
				-- }
			},


			note_id_func = function(title)
				local time = os.date("%Y%m%d%H%M", os.time())
				if title and title ~= "" then
					local suffix = title
						:gsub("%s+", "-") -- Replace spaces with dashes
						:gsub("[^A-Za-z0-9-]", "") -- Remove special characters
						:lower() -- Convert to lowercase
					return time .. "-" .. suffix
				else
					return time
				end
			end,

			note_path_func = function(spec)
				local path = spec.dir / tostring(spec.id)
				return path:with_suffix(".md")
			end,

			ui = {
				enable = false,
			},

			picker = {
				name = 'telescope.nvim',
			},
		},
	},

	{
		"jghauser/follow-md-links.nvim",
		ft = "markdown",
	},

	-- Typst
	{
		'chomosuke/typst-preview.nvim',
		ft = 'typst',
		version = '1.*',
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},

}
