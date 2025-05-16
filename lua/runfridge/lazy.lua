-- Utilities
Add("runfridge.plugins.utility.arena")
Add("runfridge.plugins.utility.harpoon")
Add("runfridge.plugins.utility.nvim-tree")
Add("runfridge.plugins.utility.telescope")
Add("runfridge.plugins.utility.tpope")
Add("runfridge.plugins.utility.zen")
-- Git
Add("runfridge.plugins.git.fugitive")
-- Theme
Add("runfridge.plugins.theme.tokyonight")
Add("runfridge.plugins.theme.web-devicons")
-- Interface
Add("runfridge.plugins.interface.color-highlighter")
Add("runfridge.plugins.interface.illuminate")
Add("runfridge.plugins.interface.indent-blankline")
Add("runfridge.plugins.interface.lualine")
Add("runfridge.plugins.interface.noice")
-- Code Syntax & LSP
Add("runfridge.plugins.lsp.conform")
Add("runfridge.plugins.lsp.copilot")
Add("runfridge.plugins.lsp.lsp")
Add("runfridge.plugins.lsp.treesitter")
-- Misc
Add("runfridge.plugins.misc.wakatime")
Add("runfridge.plugins.misc.garbage")
Add("runfridge.plugins.misc.plenary")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(PLUGIN_SPECS, {
	ui = {
		border = "single",
	},
	change_detection = {
		enabled = false,
		notify = false,
	},
})
