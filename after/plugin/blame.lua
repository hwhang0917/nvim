require("gitblame").setup {
    enabled = true,
}

-- Date Format
vim.g.gitblame_date_format = '%r'
-- Blame format
vim.g.gitblame_message_template = '  <author> • <date> • [<sha>] <summary>'
