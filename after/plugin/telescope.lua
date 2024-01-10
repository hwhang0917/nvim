local builtin = require('telescope.builtin')

-- Open Files Fuzzy Search
-- vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Open Git-Files Fuzzy Search
-- vim.keymap.set('n', '<C-o>', builtin.git_files, {})
-- Open Vim Help
vim.keymap.set('n', '<C-h>', builtin.help_tags, {})
-- Open Grep Fuzzy Search
vim.keymap.set('n', '<C-g>', function()
    builtin.grep_string({ search = vim.fn.input('🔍 Grep > ') })
end, {})
-- Open Vim Command Mode
vim.keymap.set('n', '<C-f>', function()
    builtin.commands()
end, {})


require('telescope').setup {
    defaults = {
        disable_devicons = false
    }
}
