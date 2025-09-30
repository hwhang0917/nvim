local servers = {
    "lua_ls",
    "gopls",
    "rust_analyzer",
    "ts_ls",
    "html",
    "jsonls",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "tailwindcss",
    "vue_ls",
    "yamlls",
}

for _, lsp in ipairs(servers) do
vim.lsp.enable(lsp)
end
