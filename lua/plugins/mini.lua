return {
	'echasnovski/mini.nvim',
	config = function() 
		require('mini.pick').setup()
		require('mini.notify').setup()
		require('mini.extra').setup()
	end
}
