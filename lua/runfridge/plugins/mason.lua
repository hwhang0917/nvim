return {
    "mason-org/mason.nvim",
    opts = {
        ensure_installed = {
            "docker-compose-language-service",
            "dockerfile-language-server",
            "eslint-lsp",
            "gopls",
            "html-lsp",
            "json-lsp",
            "lua-language-server",
            "nginx-language-server",
            "rust-analyzer",
            "stylua",
            "tailwindcss-language-server",
            "typescript-language-server",
            "vue-language-server",
            "xmlformatter",
            "yaml-language-server",
        },
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
    },
}
