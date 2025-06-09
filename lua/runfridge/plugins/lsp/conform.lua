return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				json = { "biome" },
				graphql = { "biome" },
				markdown = { "biome" },
				html = { "prettier" },
				css = { "biome" },
				vue = { "biome" },
			},
			formatters = {
				biome = {
					command = vim.fn.stdpath("data") .. "/mason/bin/biome.cmd",
				},
			},
			format_on_save = {
				timeout_ms = 10000,
				lsp_fallback = true,
			},
		})
	end,
}
