local options = {
    clipboard = "unnamedplus",
    relativenumber = true,
    number = true,
    wrap = false,
    scrolloff = 8,
    showmode = false,
    hlsearch = false,
    smartindent = true,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    cursorline = true
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- colorscheme
vim.cmd[[colorscheme tokyonight]]

-- leader
vim.g.mapleader = ','

-- netrw
vim.g.netrw_banner = 0

-- plugins
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

require('lualine').setup()
