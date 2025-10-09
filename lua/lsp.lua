vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
	'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
	'https://github.com/hrsh7th/cmp-nvim-lsp',
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
	},
})

require('lsp.init')

local on_attach = function(client, bufnr)
	local bufmap = function(keys, func, desc)
		desc = desc or "todo"
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	bufmap("<leader>ca", vim.lsp.buf.code_action, "code action")
	bufmap("<leader>rn", vim.lsp.buf.rename, "rename")
	bufmap("gd", vim.lsp.buf.definition, "definition")
	bufmap("gD", vim.lsp.buf.declaration, "declaration")
	bufmap("gI", vim.lsp.buf.implementation, "implementation")
	bufmap("<leader>D", vim.lsp.buf.type_definition, "type definition")

	local builtin = require("telescope.builtin")
	bufmap("gr", builtin.lsp_references, "lsp references")
	bufmap("<leader>ls", builtin.lsp_document_symbols, "lsp symbols")
	bufmap("<leader>lS", builtin.lsp_workspace_symbols, "workspace symbols")
	bufmap("<leader>K", vim.diagnostic.open_float, "diagnostics")
	bufmap("<leader>fd", builtin.diagnostics, "find diagnostics")
	bufmap("K", vim.lsp.buf.hover, "hover")
	bufmap("<leader>fmt", vim.lsp.buf.format, "format")

	-- Language Specific

	local ft = vim.api.nvim_buf_get_option(0, "filetype")
	if ft == "java" then
		bufmap("<leader><F10>", ":JavaRunnerRunMain<CR>", "run")
		bufmap("<leader>lb", ":JavaBuildBuildWorkspace<CR>", "build")
		bufmap("<leader>lc", ":JavaBuildCleanWorkspace<CR>", "clean")
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- require('neodev'))()

vim.lsp.config("luals", {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function()
		return vim.loop.cwd()
	end,
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			hint = { enable = true },
		},
	},
})

vim.lsp.config("bashls", {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
})
vim.lsp.enable("bashls", true)

vim.lsp.config("nixd", {
	on_attach = on_attach,
	capabilities = capabilities,
})
vim.lsp.enable("nixd", true)

vim.lsp.config("hyprls", {
	on_attach = on_attach,
	capabilities = capabilities,
})
vim.lsp.enable("hyprls", true)

-- vim.lsp.config.rust_analyzer) {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		['rust-analyzer'] = {
-- 			cargo = {
-- 				loadOutDirsFromCheck = true,
-- 				runBuildScripts = true,
-- 			},
-- 			procMacro = {
-- 				enable = true,
-- 			},
-- 			checkOnSave = {
-- 				command = 'check'
-- 			}
-- 		}
-- 	}
-- }

local inlayHints = {
	includeInlayParameterNameHints = "all",
	includeInlayParameterNameHintsWhenArgumentMatchesName = false,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayVariableTypeHints = true,
	includeInlayVariableTypeHintsWhenTypeMatchesName = false,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayEnumMemberValueHints = true,
}

vim.lsp.config("ts_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	settings = {
		typescript = {
			inlayHints = inlayHints,
		},
		javascript = {
			inlayHints = inlayHints,
		},
	},
})
vim.lsp.enable("ts_ls", true)

vim.lsp.config("html", {
	on_attach = on_attach,
	capabilities = capabilities,
})
vim.lsp.enable("html", true)

vim.lsp.config("jedi-language-server", {
	on_attach = on_attach,
	capabilities = capabilities,
})
vim.lsp.enable("jedi-language-server", true)

vim.lsp.config("cssls", {})
vim.lsp.enable("cssls", true)

vim.lsp.config("jdtls", {
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = {
		-- By assigning an empty function, you can remove the notifications
		-- printed to the cmd
		["$/progress"] = function(_, result, ctx) end,
	},
})
vim.lsp.enable("jdtls", true)
