vim.keymap.set("n", "<leader>zz", function()
	require("zen-mode").toggle({ window = { width = 0.8 } })
	vim.cmd("Gitsigns toggle_current_line_blame")
end, {})
