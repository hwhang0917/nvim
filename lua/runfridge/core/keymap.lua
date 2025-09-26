local utils = require("runfridge.utils")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local base = { noremap = true, silent = true }
local function O(extra) return utils.merge_table(base, extra or {}) end

-- Reserve <Space> as leader
map({ "n", "v", "x", "s" }, "<Space>", "<Nop>", O())

-- Kill legacy Ex
map("n", "Q", "<Nop>", O({ desc = "Disable Ex mode" }))
-- Terminal: double Esc -> normal

map("t", "<Esc><Esc>", [[<C-\><C-n>]], O({ desc = "Exit terminal mode" }))

-- Clear search highlight
map("n", "<leader>chl", "<cmd>nohlsearch<CR>", O({ desc = "Clear highlights" }))

-- Center after jumps
map("n", "<C-d>", "<C-d>zz", O())
map("n", "<C-u>", "<C-u>zz", O())
map("n", "n", "nzzzv", O())
map("n", "N", "Nzzzv", O())

-- Move line(s)
map("n", "<leader>j", ":m .+1<CR>==", O({ desc = "Move line down" }))
map("n", "<leader>k", ":m .-2<CR>==", O({ desc = "Move line up" }))
map("x", "<leader>j", ":m '>+1<CR>gv=gv", O({ desc = "Move selection down" }))
map("x", "<leader>k", ":m '<-2<CR>gv=gv", O({ desc = "Move selection up" }))

-- Paste over selection without yanking it
map("x", "<leader>p", [["_dP]], O({ desc = "Paste keep register" }))

-- System clipboard
map("n", "<leader>y", [["+y]], O({ desc = "Yank to system clipboard" }))
map("v", "<leader>y", [["+y]], O())
map("n", "<leader>Y", [["+Y]], O())
map("n", "<leader>d", [["_d]], O({ desc = "Delete to blackhole" }))
map("v", "<leader>d", [["_d]], O())

-- Substitute word under cursor
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    utils.merge_table(base, { silent = false, desc = "Substitute word under cursor" }))

-- Splits
map("n", "<C-w>-", "<cmd>vsplit<CR>", O({ desc = "Vertical split" }))
map("n", "<C-w>_", "<cmd>split<CR>",  O({ desc = "Horizontal split" }))

-- Toggle wrap
map("n", "<leader>lw", function() vim.wo.wrap = not vim.wo.wrap end, O({ desc = "Toggle wrap" }))

-- Diagnostics
map("n", "[g", function() vim.diagnostic.goto_prev() end, O({ desc = "Prev diagnostic" }))
map("n", "]g", function() vim.diagnostic.goto_next() end, O({ desc = "Next diagnostic" }))
