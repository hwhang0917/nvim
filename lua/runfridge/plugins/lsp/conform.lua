return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "jq" },
				graphql = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				vue = { "prettier" },
			},
			-- format_on_save = {
			-- 	timeout_ms = 10000,
			-- 	lsp_fallback = true,
			-- },
		})
	end,
}
