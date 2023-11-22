-- Default Enabled
vim.cmd('IndentGuidesEnable')

-- Toggle Indent Guides
vim.keymap.set('n', '<leader>ig', function() vim.cmd('IndentGuidesToggle') end)
