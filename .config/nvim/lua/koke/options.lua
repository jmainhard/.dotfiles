local options = {
	clipboard = "unnamedplus",
	expandtab = false,
	shiftwidth = 4,                          -- the number of spaces inserted for each indentation
	relativenumber = true,
	nu = true,
	wrap = false,
	scrolloff = 8,
	tabstop = 4,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- colorscheme
vim.cmd[[colorscheme tokyonight]]

-- leader
vim.g.mapleader = ' '

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
