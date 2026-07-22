return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function ()
		telescope = require('telescope')
		telescope.load_extension("fidget")
	end
}
