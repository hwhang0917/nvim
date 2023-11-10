local builtin = require('telescope.builtin')

-- Open Files Fuzzy Search
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- Open Git-Files Fuzzy Search
vim.keymap.set('n', '<C-a>', builtin.git_files, {})
-- Open Grep Fuzzy Search
vim.keymap.set('n', '<C-g>', function()
    builtin.grep_string({ search = vim.fn.input('🔍 Grep > ') })
end, {})
