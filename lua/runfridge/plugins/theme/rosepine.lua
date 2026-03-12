local default_theme = "rose-pine"
local default_transparency = true

return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		local os_icons = { Windows_NT = "", Linux = "", Darwin = "" }
		local os_icon = os_icons[vim.uv.os_uname().sysname] or "💀"
		vim.opt.laststatus = 2
		vim.opt.statusline = " %f %m %= %l:%c " .. os_icon .. " "

		require("rose-pine").setup({
			highlight_groups = {
				StatusLine = { fg = "iris", bg = "iris", blend = 10 },
				StatusLineNC = { fg = "subtle", bg = "surface" },
			},
		})

		vim.cmd.colorscheme(default_theme)

		function RCS(color)
			color = color or default_theme
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "gray" })
		end

		local IsToggled = default_transparency

		function TOB(color)
			if IsToggled then
				color = color or default_theme
				vim.cmd.colorscheme(color)
			else
				RCS()
			end
			IsToggled = not IsToggled
		end

		vim.keymap.set("n", "<leader>tt", TOB, { noremap = true, silent = true })

		if default_transparency then
			RCS()
		end
	end,
}
