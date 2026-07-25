require('config.opts')
require('config.autocmd')
require('config.diagnostic')

require('config.load_plugins')
require('config.remap')

require('config.lsp')


vim.pack.add('https://github.com/olimorris/onedarkpro.nvim')
vim.cmd('colorscheme onedark')
