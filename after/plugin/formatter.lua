local autocmd_group = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })

-- Format JavaScript and TypeScript files after saving (use Prettier)
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.mjs", "*.cjs" },
    desc = "Auto-format JavaScript and TypeScript files after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd("silent !prettier --log-level silent --write " .. fileName)
    end,
    group = autocmd_group
})
