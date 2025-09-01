return {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
	opts = {
		-- Main options
		aggressive_mode = false,
		grace_period = 60 * 15, -- 15 minutes (default)
		wakeup_delay = 0,

		-- Debugging options
		notifications = false, -- Set to true for debugging
		retries = 3,
		timeout = 1000,

		-- LSP clients that should never be stopped
		excluded_lsp_clients = {
			"null-ls",
			"jdtls",
			"marksman",
			"lua_ls",
		},

		-- Buffers to ignore in aggressive mode
		aggressive_mode_ignore = {
			filetype = { "", "markdown", "text", "org", "tex", "asciidoc", "rst" },
			buftype = { "nofile" },
		},
	},
}
