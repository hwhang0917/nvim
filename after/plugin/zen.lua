vim.keymap.set('n', '<leader>zz', function()
    require('zen-mode').toggle({ window = { width = 0.8 } })
    vim.cmd('GitBlameToggle')
end, {})
