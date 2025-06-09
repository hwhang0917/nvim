return {
	"stevearc/conform.nvim",
	config = function()
		local os = GetOS()
		local formatters_config = {}
		if os == "windows" then
			formatters_config.biome = {
				command = vim.fn.stdpath("data") .. "/mason/bin/biome.exe",
				timeout_ms = 5000,
			}
            -- setup orphaned biome taskkill
            vim.api.nvim_create_autocmd("VimLeavePre", {
                callback = function()
                    vim.fn.system("taskkill /F /IM biome.exe 2>nul")
                end
            })
		elseif os == "macos" or os == "linux" then
			formatters_config.biome = {
				command = vim.fn.stdpath("data") .. "/mason/bin/biome",
			}
		else
			formatters_config.biome = {
				command = "biome",
			}
		end
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
			formatters = formatters_config,
			-- format_on_save = {
			-- 	timeout_ms = 10000,
			-- 	lsp_fallback = true,
			-- },
		})
	end,
}
