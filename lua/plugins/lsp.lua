return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',
		'saadparwaiz1/cmp_luasnip',
		'L3MON4D3/LuaSnip',
		{
			'mrcjkb/rustaceanvim',
			version = '^6', -- Recommended
			lazy = false, -- This plugin is already lazy
			config = function()
				local bufnr = vim.api.nvim_get_current_buf()
				vim.keymap.set(
					"n",
					"<leader>a",
					function()
						vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
						-- or vim.lsp.buf.codeAction() if you don't want grouping.
					end,
					{ silent = true, buffer = bufnr }
				)
				vim.keymap.set(
					"n",
					"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
					function()
						vim.cmd.RustLsp({ 'hover', 'actions' })
					end,
					{ silent = true, buffer = bufnr }
				)
			end
		},
		'nvim-java/nvim-java',
	},

	config = function()


		local on_attach = function(_, bufnr)
			local bufmap = function(keys, func, desc)
				desc = desc or 'todo'
				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
			end

			bufmap('<leader>ca', vim.lsp.buf.code_action, 'code action')
			bufmap('<leader>rn', vim.lsp.buf.rename, 'rename')

			bufmap('gd', vim.lsp.buf.definition, 'definition')
			bufmap('gD', vim.lsp.buf.declaration, 'declaration')
			bufmap('gI', vim.lsp.buf.implementation, 'implementation')
			bufmap('<leader>D', vim.lsp.buf.type_definition, 'type definition')

			local builtin = require('telescope.builtin')
			bufmap('gr', builtin.lsp_references, 'lsp references')
			bufmap('<leader>ls', builtin.lsp_document_symbols, 'lsp symbols')
			bufmap('<leader>lS', builtin.lsp_workspace_symbols, 'workspace symbols')

			bufmap('<leader>K', vim.diagnostic.open_float, 'diagnostics')
			bufmap('<leader>fd', builtin.diagnostics, 'find diagnostics')

			bufmap('K', vim.lsp.buf.hover, 'hover')

			bufmap('<leader>fmt', vim.lsp.buf.format, 'format')

			-- Language Specific
			local ft = vim.api.nvim_buf_get_option(0, 'filetype')
			if ft == 'java' then
				bufmap('<leader><F10>', ':JavaRunnerRunMain<CR>', 'run')
				bufmap('<leader>lb', ':JavaBuildBuildWorkspace<CR>', 'build')
				bufmap('<leader>lc', ':JavaBuildCleanWorkspace<CR>', 'clean')
			end
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		-- require('neodev'))()
		vim.lsp.config.lua_ls = {
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = function()
				return vim.loop.cwd()
			end,
			cmd = { 'lua-language-server' },
			settings = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
					hint = { enable = true },
				},
			}
		}

		vim.lsp.config.bashls = {
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { 'bash-language-server', 'start' },
			filetypes = { 'bash', 'sh' },
		}

		vim.lsp.config.nixd = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		vim.lsp.config.hyprls = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		-- vim.lsp.config.rust_analyzer) {
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	settings = {
		-- 		['rust-analyzer'] = {
		-- 			cargo = {
		-- 				loadOutDirsFromCheck = true,
		-- 				runBuildScripts = true,
		-- 				features = 'all',
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
			includeInlayParameterNameHints = 'all',
			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayVariableTypeHintsWhenTypeMatchesName = false,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		}

		vim.lsp.config.ts_ls = {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
			settings = {
				typescript = {
					inlayHints = inlayHints,
				},
				javascript = {
					inlayHints = inlayHints,
				},
			}
		}

		vim.lsp.config.html = {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		vim.lsp.config.cssls = {}


		require('java').setup {
			java_test = {
				version = "0.43.1",
			},
			spring_boot_tools = {
				version = '1.59.0',
			},
			jdk = {
				auto_install = false,
			}
		}

		vim.lsp.config.jdtls = {
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = {
				-- By assigning an empty function, you can remove the notifications
				-- printed to the cmd
				["$/progress"] = function(_, result, ctx) end,
			},
		}
	end
}
