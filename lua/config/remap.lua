vim.g.mapleader = ' '

local map = vim.keymap.set 

map('n', '<leader>pv', vim.cmd.Ex)
map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
map({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')


map('n', '<leader>ff', ":Pick files<CR>")
map('n', '<leader>fg', ":Pick live_grep<CR>")
map('n', '<leader>fh', ":Pick help<CR>")

map('n', '-', ":Oil<CR>")

-- -- Undotree
-- map('n', '<leader><F5>', vim.cmd.UndotreeToggle)
