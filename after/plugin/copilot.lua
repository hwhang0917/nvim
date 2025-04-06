local noice = require("noice")

vim.keymap.set("i", "<C-c>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
vim.g.copilot_enabled = true

vim.keymap.set("n", "<leader>tc", function()
    local copilot_exists = vim.fn.exists("g:copilot_enabled") == 1
    if not copilot_exists then return end

    local value = vim.g.copilot_enabled
    local is_enabled is_enabled = value == vim.v['true'] or value == 1

    local status_message
    if is_enabled then
        vim.cmd("Copilot disable")
        status_message = "disabled"
    else
        vim.cmd("Copilot enable")
        status_message = "enabled"
    end
    noice.notify("Copilot has been " .. status_message, "info", {
        title = "Copilot Status",
        timeout = 1000
    })
end, { desc = "Copilot Toggle" })
