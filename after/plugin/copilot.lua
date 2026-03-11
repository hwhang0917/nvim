vim.keymap.set("i", "<C-c>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
vim.g.copilot_enabled = true

local quota_disabled = false

local function check_copilot_quota()
	if quota_disabled or not vim.g.copilot_enabled then return end

	local state = vim.b._copilot
	if type(state) ~= "table" or type(state.error) ~= "table" then return end

	local msg = (state.error.message or ""):lower()
	if msg:match("quota") or msg:match("rate limit") or msg:match("usage limit") or msg:match("exceeded") then
		vim.cmd("Copilot disable")
		vim.g.copilot_enabled = false
		quota_disabled = true
		Notify("Copilot Status", "Copilot disabled: monthly quota used up")
	end
end

vim.api.nvim_create_autocmd("InsertLeave", { callback = check_copilot_quota })

vim.keymap.set("n", "<leader>cp", function()
	if vim.g.copilot_enabled then
		vim.cmd("Copilot disable")
		vim.g.copilot_enabled = false
		Notify("Copilot Status", "Copilot has been disabled")
	else
		vim.cmd("Copilot enable")
		vim.g.copilot_enabled = true
		quota_disabled = false
		Notify("Copilot Status", "Copilot has been enabled")
	end
end, { desc = "Copilot Toggle" })
