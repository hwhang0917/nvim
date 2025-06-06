local lsp = require("lsp-zero")
local mason_registry = require("mason-registry")

lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- Set completeopt to have a better completion experience
local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = cmp_kinds[vim_item.kind] or ""
			return vim_item
		end,
	},
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gr", function()
		require("telescope.builtin").lsp_references()
	end, MergeTable(opts, { desc = "LSP Goto Reference" }))
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, MergeTable(opts, { desc = "LSP Goto Definition" }))
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, MergeTable(opts, { desc = "LSP Hover" }))
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, MergeTable(opts, { desc = "LSP Workspace Symbol" }))
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.setloclist()
	end, MergeTable(opts, { desc = "LSP Show Diagnostics" }))
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, MergeTable(opts, { desc = "Next Diagnostic" }))
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, MergeTable(opts, { desc = "Previous Diagnostic" }))
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, MergeTable(opts, { desc = "LSP Code Action" }))
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, MergeTable(opts, { desc = "LSP Rename" }))
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, MergeTable(opts, { desc = "LSP Signature Help" }))
end)

mason_registry.refresh(function()
    lsp.ensure_installed({
        "lua_ls",
        "ts_ls",
        "eslint",
        "tailwindcss",
        "yamlls",
        "rust_analyzer",
        "jsonls",
        "html",
        "dockerls",
        "bashls",
        "volar",
        "gopls",
    })

    -- Setup vue language server in Hybrid mode
    local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
        .. "/node_modules/@vue/language-server"

    local lspconfig = require("lspconfig")
    lspconfig.ts_ls.setup({
        init_options = {
            plugins = {
                {
                    name = "@vue/typescript-plugin",
                    location = vue_language_server_path,
                    languages = { "vue" },
                },
            },
        },

        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    })
    lspconfig.volar.setup({})
    lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
    lsp.setup()
end)

local cmp_action = require("lsp-zero").cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "path" },
	},
	mapping = {
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	},
})
