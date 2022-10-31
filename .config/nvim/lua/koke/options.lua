local options = {
    clipboard = "unnamedplus",
    expandtab = false,
    relativenumber = true,
    nu = true,
    wrap = false,
    scrolloff = 8,
    showmode = false,
    smartindent = true,
    tabstop = 4,
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    expandtab = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- colorscheme
vim.cmd[[colorscheme tokyonight]]

-- leader
vim.g.mapleader = ' '

-- plugins
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

require('lualine').setup()
