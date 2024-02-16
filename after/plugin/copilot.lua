vim.keymap.set('i', '<C-c>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
vim.g.copilot_enabled = true
