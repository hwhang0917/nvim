local api = require('nvim-tree.api')

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable highlight group
vim.opt.termguicolors = true

-- Setup Nvim Tree
require('nvim-tree').setup({
    view = {
        number = true,
        relativenumber = true
    },
    renderer = {
        add_trailing = true,
        indent_markers = {
            enable = true
        }
    }
})

-- Toggle Nvim Tree
vim.keymap.set('n', '<C-n>', function ()
    api.tree.toggle()
end)
