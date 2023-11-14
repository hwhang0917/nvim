-- Disable Quickfix
vim.g["prettier#quickfix_enabled"]=0

-- Automatically run PrettierAsync on specified file types
vim.api.nvim_exec([[
  autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
]], false)
