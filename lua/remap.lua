vim.g.truemapleader = ' '
vim.g.mapleader = ' '

local map = vim.keymap.set

map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>', { desc = "switch windows" })
map('n', '<bs>', ':e #<CR>', { desc = "switch windows" })
map('t', '<C-x>', '<C-\\><C-n><C-w>q', { desc = "exit terminal" })

-- telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = "find files" })
map('n', '<leader>fg', builtin.live_grep, { desc = "live grep" })
map('n', '<leader>fh', builtin.man_pages, { desc = "search help" })
map('n', '<leader>fp', builtin.builtin, { desc = "search pickers" })
map('n', '<leader>fP', builtin.planets, { desc = "search planets" })
map('n', '<leader>cs', builtin.spell_suggest, { desc = "check spelling" })

-- mini.files
map('n', '<leader>pv', ':lua MiniFiles.open()<CR>', { desc = "open mini.files" })
map('n', '<leader>e', ':lua MiniFiles.open()<CR>', { desc = "open mini.files" })
map('n', '-', ':lua MiniFiles.open()<CR>', { desc = "open mini.files" })

-- undotree
map('n', '<leader><F5>', ':UndotreeToggle<CR>', { desc = 'undotree' })
