-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Toggle Nvim Tree
vim.keymap.set('n', '<C-n>', function()
    require('nvim-tree.api').tree.toggle()
end, {})
