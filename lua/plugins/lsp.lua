return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'mason-org/mason.nvim',
			'mason-org/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',
			'hrsh7th/cmp-nvim-lsp',
			-- 'MysticalDevil/inlay-hints.nvim',
		},
		-- vim.pack.add({
		-- 	'https://github.com/neovim/nvim-lspconfig',
		-- 	'https://github.com/mason-org/mason.nvim',
		-- 	'https://github.com/mason-org/mason-lspconfig.nvim',
		-- 	'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
		-- 	'https://github.com/hrsh7th/cmp-nvim-lsp',
		-- })
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"lua_ls",
				},
			})

			-- require("inlay-hints").setup({
			-- 	commands = { enable = true }, -- Enable commands: InlayHintsToggle, InlayHintsEnable, InlayHintsDisable
			-- 	autocmd = { enable = true }, -- Auto-enable inlay hints on LspAttach
			-- })


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
				bufmap("<leader>ld", vim.lsp.buf.definition, "definition")
				bufmap("<leader>lD", vim.lsp.buf.declaration, "declaration")
				bufmap("<leader>lI", vim.lsp.buf.implementation, "implementation")
				bufmap("<leader>ltd", vim.lsp.buf.type_definition, "type definition")

				local builtin = require("telescope.builtin")
				bufmap("gr", builtin.lsp_references, "lsp references")
				bufmap("<leader>ls", builtin.lsp_document_symbols, "lsp symbols")
				bufmap("<leader>lS", builtin.lsp_workspace_symbols, "workspace symbols")
				bufmap("<A-k>", vim.diagnostic.open_float, "diagnostics")
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

			vim.lsp.config("lua_ls", {
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
				cmd = { "lua-language-server" },
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						hint = { enable = true },
					},
				},
			})
			vim.lsp.enable("lua_ls", true)

			vim.lsp.config("bashls", {
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
				cmd = { "bash-language-server", "start" },
				filetypes = { "bash", "sh" },
			})
			vim.lsp.enable("bashls", true)

			vim.lsp.config("nixd", {
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.enable("nixd", true)

			vim.lsp.config("hyprls", {
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.enable("hyprls", true)

			-- vim.lsp.config.rust_analyzer) {
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- handlers = handlers,
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
				handlers = handlers,
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
				handlers = handlers,
			})
			vim.lsp.enable("html", true)

			vim.lsp.config("jedi_language_server", {
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.enable("jedi_language_server", true)

			vim.lsp.config("cssls", {})
			vim.lsp.enable("cssls", true)

			vim.lsp.config("jdtls", {
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
				handlers = {
					-- By assigning an empty function, you can remove the notifications
					-- printed to the cmd
					["$/progress"] = function(_, result, ctx) end,
				},
			})
			vim.lsp.enable("jdtls", true)

			vim.lsp.config("clangd", {
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
				cmd = {
					"clangd",
					"--query-driver=/nix/store/*-clang-wrapper-*/bin/clang"
				}
			})

			vim.lsp.enable("clangd", true)

			vim.lsp.enable("qmlls", true)

			vim.lsp.config("zls", {
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.enable("zls", true)

			vim.lsp.config("gopls", {
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
				settings = {
					gopls = {
						semanticTokens = true,
						-- hints = {
						-- 	rangeVariableTypes = true,
						-- 	parameterNames = true,
						-- 	assignVariableTypes = true,
						-- 	compositeLiteralTypes = true,
						-- 	functionTypeParameters = true,
						-- }
					}
				}
			})
			vim.lsp.enable("gopls", true)

			local odin_dir = os.getenv("ODIN_DIR")

			if odin_dir ~= nil then
				vim.lsp.config("ols", {
					on_attach = on_attach,
					capabilities = capabilities,
					handlers = handlers,
					init_options = {
						collections = {
							{ name = "base",   path = odin_dir .. "/share/base" },
							{ name = "core",   path = odin_dir .. "/share/core" },
							{ name = "vendor", path = odin_dir .. "/share/vendor" },
							{ name = "shared", path = odin_dir .. "/share/shared" },
						},
						enable_document_symbols = true,
						enable_hover = true,
						enable_snippets = true,
						enable_semantic_tokens = false,
					},
				})

				vim.lsp.enable("ols", true)

				vim.lsp.config("gdscript", {
					on_attach = on_attach,
					capabilities = capabilities,
					handlers = handlers,
				})
				vim.lsp.enable("gdscript", true)

				vim.lsp.config("ocamllsp", {
					on_attach = on_attach,
					capabilities = capabilities,
				})
				vim.lsp.enable("ocamllsp", true)
			end
		end
	},
	{
		'nvim-java/nvim-java',
		config = function()
			require('java').setup {
				java_test = {
					version = "0.43.1",
				},
				spring_boot_tools = {
					version = '1.59.0',
				},
				jdk = {
					-- auto_install = os.get_env('NIX_NEOVIM') == '1',
					auto_install = false,
				}
			}
		end
	}
}
