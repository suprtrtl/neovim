vim.pack.add({
	'https://github.com/nvim-java/lua-async-await',
	'https://github.com/nvim-java/nvim-java-refactor',
	'https://github.com/nvim-java/nvim-java-core',
	'https://github.com/nvim-java/nvim-java-test',
	'https://github.com/nvim-java/nvim-java-dap',
	'https://github.com/MunifTanjim/nui.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mfussenegger/nvim-dap',
	'https://github.com/nvim-java/nvim-java',
	'https://github.com/JavaHello/spring-boot.nvim',
	'https://github.com/mason-org/mason.nvim'
})

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
