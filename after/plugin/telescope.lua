local builtin = require("telescope.builtin")

-- Open vim help
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
-- Open grep fuzzy search
vim.keymap.set("n", "<C-g>", function()
	builtin.grep_string({ search = vim.fn.input("🔍 Grep >") })
end, {})
-- Open current buffer find
vim.keymap.set("n", "<C-f>", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		windblend = 10,
		previewer = false,
		layout_config = { width = 0.7 },
	}))
end, {})

-- Git search and commit search for Git directory
if IsGitRepo() then
	vim.keymap.set("n", "<C-p>", builtin.git_files, {})
	vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
	vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits, {})
	-- Normal file search for non-Git
else
	vim.keymap.set("n", "<C-p>", builtin.find_files, {})
end

-- Extensions
require("telescope").load_extension("noice")

-- Disable <C-o>
vim.keymap.set("n", "<C-o>", "<nop>", {})
