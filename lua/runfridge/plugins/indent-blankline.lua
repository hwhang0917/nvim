return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
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
    },
}
