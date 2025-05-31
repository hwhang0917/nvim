return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.5",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release",
		},
	},
	cmd = "Telescope",
	config = function()
		require("telescope").setup({
			defaults = {
				disable_devicons = false,
				path_display = { "truncate" },
			},
		})
	end,
}
