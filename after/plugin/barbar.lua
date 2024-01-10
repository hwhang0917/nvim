require 'barbar'.setup {
    sidebar_filetypes = {
        NvimTree = true,
        undotree = { text = 'undotree' },
    }
}

vim.keymap.set('n', '<M-j>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<M-k>', '<Cmd>BufferNext<CR>')
vim.keymap.set('n', '<M-p>', '<Cmd>BufferPin<CR>')
vim.keymap.set('n', '<M-w>', '<Cmd>BufferClose<CR>')

-- Resize Barbar Tab Location depending on Nvim-Tree
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
    return require 'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
    bufferline_api.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('Resize', function()
    bufferline_api.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('TreeClose', function()
    bufferline_api.set_offset(0)
end)
