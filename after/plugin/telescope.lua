local builtin = require('telescope.builtin')

-- Open Files Fuzzy Search
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- Open Git-Files Fuzzy Search
vim.keymap.set('n', '<C-o>', builtin.git_files, {})
-- Open Vim Help
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gbc', builtin.git_bcommits, {})
-- Open Grep Fuzzy Search
vim.keymap.set('n', '<C-g>', function()
    builtin.grep_string({ search = vim.fn.input('🔍 Grep > ') })
end, {})


require('telescope').setup {
    defaults = {
        disable_devicons = false,
        path_display = { "truncate" },
    }
}
