-- Toggle Nvim Tree
vim.keymap.set("n", "<C-n>", function()
	require("nvim-tree.api").tree.toggle()
end, {})
