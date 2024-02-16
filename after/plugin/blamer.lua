require('gitblame').setup({
    enable = true,
})

vim.g.gitblame_date_format = '%r'
vim.g.gitblame_message_template = '<author> • <date> • <summary>>'

-- Toggle git blame
vim.keymap.set('n', '<leader>gb', '<cmd>GitBlameToggle<cr>', { noremap = true, silent = true })
