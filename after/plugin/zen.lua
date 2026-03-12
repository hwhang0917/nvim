vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle({ window = { width = 0.95 } })
    vim.cmd("Gitsigns toggle_current_line_blame")
end, {})
