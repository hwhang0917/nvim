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
				json = { "prettier" },
				graphql = { "prettier" },
				markdown = { "prettier" },
				html = { "htmlbeautifier" },
				bash = { "beautysh" },
				yaml = { "yamlfix" },
				css = { "prettier" },
				vue = { "volar", "prettier" },
			},
			format_on_save = {
				timeout_ms = 10000,
				lsp_fallback = true,
			},
		})
	end,
}
