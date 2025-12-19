vim.g.truemapleader = ' '

local map = vim.keymap.set

map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>', { desc = "switch windows" })
map('n', '<bs>', ':e #<CR>', { desc = "switch windows" })
map('t', '<C-x>', '<C-\\><C-n><C-w>q', { desc = "exit terminal" })

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = "find files" })
map('n', '<leader>fg', builtin.live_grep, { desc = "live grep" })
map('n', '<leader>fh', builtin.man_pages, { desc = "search help" })
map('n', '<leader>fp', builtin.builtin, { desc = "search pickers" })
map('n', '<leader>fP', builtin.planets, { desc = "search planets" })

map('n', '<leader>pv', ':lua MiniFiles.open()<CR>', { desc = "open mini.files" })
map('n', '<leader>e', ':lua MiniFiles.open()<CR>', { desc = "open mini.files" })
map('n', '-', ':lua MiniFiles.open()<CR>', { desc = "open mini.files" })

map('n', '<leader>cs', builtin.spell_suggest, { desc = "check spelling" })

map('n', '<leader>mvt', ':Markview toggle<CR>', { desc = 'toggle' })
map('n', '<leader>mvs', ':Markview splitToggle<CR>', { desc = 'split toggle' })

-- -- Undotree
map('n', '<leader><F5>', ':UndotreeToggle<CR>', { desc = 'undotree' })

-- Snacks
map('n', '<leader>!', 'lua Snacks.terminal()', { desc = 'open terminal window' })


-- Obsidian
map('n', '<leader>oo', ':Obsidian<CR>', { desc = "obsidian" })
map('n', '<leader>ob', ':Obsidian backlinks<CR>', { desc = "obsidian backlinks" })
map('n', '<leader>od', ':Obsidian dailies<CR>', { desc = "obsidian dailies" })
map('n', '<leader>ol', ':Obsidian links<CR>', { desc = "obsidian links" })
map('v', '<leader>ogl', ':Obsidian link<CR>', { desc = "generate obsidian link" })
map('n', '<leader>on', ':Obsidian new<CR>', { desc = "new obsidian" })
map('n', '<leader>oN', ':Obsidian new_from_template<CR>', { desc = "new obsidian from template" })
map('n', '<leader>os', ':Obsidian quick_switch<CR>', { desc = "obsidian switch" })
map('n', '<leader>orn', ':Obsidian rename<CR>', { desc = "obsidian rename" })
map('n', '<leader>oS', ':Obsidian search<CR>', { desc = "obsidian search" })
map('n', '<leader>ot', ':Obsidian tags<CR>', { desc = "obsidian tag search" })
map('n', '<leader>oit', ':Obsidian template<CR>', { desc = "obsidian insert template" })
