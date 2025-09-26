local arena = require("arena")

-- Keybindings
vim.keymap.set("n", "<leader>b", function() arena.toggle() end)
