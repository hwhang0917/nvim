return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			exclude = {
				filetypes = {
					"terminal",
					"dashboard",
					"lazy",
					"lspinfo",
					"TelescopePrompt",
					"TelescopeResults",
				},
			},
		})
	end,
}
