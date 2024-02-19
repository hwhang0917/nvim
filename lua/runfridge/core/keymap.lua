local insert_mode = "i"
local normal_mode = "n"
local terminal_mode = "t"
local visual_mode = "v"
local visual_block_mode = "x"
local command_mode = "c"

local opts = { noremap = true, silent = true }
local no_silent_opts = { noremap = true, silent = false }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
local keymap_fn = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Just for sanity
keymap("", "<Space>", "<Nop>", opts)
keymap(normal_mode, "Q", "<nop>", opts)

-- Deny regular keys
keymap(normal_mode, "<left>", ":echohl WarningMsg<Bar>echo 'USE h you SWINE!'<Bar>echohl None<CR>", opts)
keymap(normal_mode, "<right>", ":echohl WarningMsg<Bar>echo 'USE l you SWINE!'<Bar>echohl None<CR>", opts)
keymap(normal_mode, "<up>", ":echohl WarningMsg<Bar>echo 'USE k you SWINE!'<Bar>echohl None<CR>", opts)
keymap(normal_mode, "<down>", ":echohl WarningMsg<Bar>echo 'USE j you SWINE!'<Bar>echohl None<CR>", opts)
keymap(insert_mode, "<left>", "<C-o>:echohl WarningMsg<Bar>echo 'USE h you SWINE!'<Bar>echohl None<CR>", opts)
keymap(insert_mode, "<right>", "<C-o>:echohl WarningMsg<Bar>echo 'USE l you SWINE!'<Bar>echohl None<CR>", opts)
keymap(insert_mode, "<up>", "<C-o>:echohl WarningMsg<Bar>echo 'USE k you SWINE!'<Bar>echohl None<CR>", opts)
keymap(insert_mode, "<down>", "<C-o>:echohl WarningMsg<Bar>echo 'USE j you SWINE!'<Bar>echohl None<CR>", opts)

-- Unhighlight search
keymap(normal_mode, "<leader>chl", ":nohl<CR>", opts)

-- Center navigation
keymap(normal_mode, "<C-d>", "<C-d>zz", opts)
keymap(normal_mode, "<C-u>", "<C-u>zz", opts)
keymap(normal_mode, "n", "nzzzv", opts)
keymap(normal_mode, "N", "Nzzzv", opts)

-- Move line up/down
keymap(normal_mode, "<leader>j", "ddp", opts)
keymap(normal_mode, "<leader>k", "ddkP", opts)

-- Register for yank and paste
keymap(visual_block_mode, "<leader>p", "\"_dP", opts)

keymap(normal_mode, "<leader>y", "\"+y", opts)
keymap(visual_mode, "<leader>y", "\"+y", opts)
keymap(normal_mode, "<leader>Y", "\"+Y", opts)

keymap(normal_mode, "<leader>d", "\"_d", opts)
keymap(visual_mode, "<leader>d", "\"_d", opts)

-- Convenient keymap
keymap(normal_mode, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], no_silent_opts)

-- Screen split
keymap(normal_mode, "<C-w>-", ":vsplit<CR>", opts)
keymap(normal_mode, "<C-w>_", ":split<CR>", opts)

-- Toggle line wrapping
keymap_fn(normal_mode, "<leader>lw", function()
    vim.wo.wrap = not vim.wo.wrap
end, opts)
