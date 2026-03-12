local quota_disabled = false

return {
	"github/copilot.vim",
	event = "InsertEnter",
	keys = {
		{ "<leader>cp", function()
			if vim.g.copilot_enabled then
				vim.cmd("Copilot disable")
				vim.g.copilot_enabled = false
				require("runfridge.utils").notify("Copilot Status", "Copilot has been disabled")
			else
				vim.cmd("Copilot enable")
				vim.g.copilot_enabled = true
				quota_disabled = false
				require("runfridge.utils").notify("Copilot Status", "Copilot has been enabled")
			end
		end, desc = "Copilot Toggle" },
	},
	init = function()
		vim.g.copilot_no_tab_map = true
		vim.g.copilot_enabled = true
	end,
	config = function()
		vim.keymap.set("i", "<C-c>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			callback = function()
				if quota_disabled or not vim.g.copilot_enabled then return end
				local state = vim.b._copilot
				if type(state) ~= "table" or type(state.error) ~= "table" then return end
				local msg = (state.error.message or ""):lower()
				if msg:match("quota") or msg:match("rate limit") or msg:match("usage limit") or msg:match("exceeded") then
					vim.cmd("Copilot disable")
					vim.g.copilot_enabled = false
					quota_disabled = true
					require("runfridge.utils").notify("Copilot Status", "Copilot disabled: monthly quota used up")
				end
			end,
		})
	end,
}
