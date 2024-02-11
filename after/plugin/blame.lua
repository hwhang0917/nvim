require("gitblame").setup {
    enabled = true,
}

-- Date Format
vim.g.gitblame_date_format = '%r'
-- Blame format
vim.g.gitblame_message_template = '  <author> • <date> • <summary>'

-- Toggle Git Blame
vim.keymap.set("n", "<leader>gb", function() vim.cmd("GitBlameToggle") end, { silent = true })
