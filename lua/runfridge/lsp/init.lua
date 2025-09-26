-- Enhanced LSP configuration with better capabilities and error handling
local M = {}

-- Enhanced capabilities with more complete LSP features
local function get_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Enhanced completion capabilities
    capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        },
    }

    -- Folding range support
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }

    -- Semantic tokens with better support
    capabilities.textDocument.semanticTokens = {
        multilineTokenSupport = true,
        overlappingTokenSupport = true,
        tokenTypes = {
            "namespace", "type", "class", "enum", "interface", "struct",
            "typeParameter", "parameter", "variable", "property", "enumMember",
            "event", "function", "method", "macro", "keyword", "modifier",
            "comment", "string", "number", "regexp", "operator", "decorator"
        },
        tokenModifiers = {
            "declaration", "definition", "readonly", "static", "deprecated",
            "abstract", "async", "modification", "documentation", "defaultLibrary"
        },
        formats = { "relative" },
        requests = {
            range = true,
            full = { delta = true }
        }
    }

    return capabilities
end

-- Global LSP configuration with enhanced capabilities
vim.lsp.config('*', {
    capabilities = get_capabilities(),
    root_markers = { '.git', 'package.json', 'Cargo.toml', 'go.mod', 'pyproject.toml', '.luarc.json' },

    -- Enhanced settings
    settings = {},

    -- Add common flags
    flags = {
        debounce_text_changes = 150,
    },
})

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
        prefix = "●",
    },
    float = {
        source = "if_many",
        border = "rounded",
        header = "",
        prefix = "",
        focusable = false,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "»",
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticLineError',
        },
        numhl = {
            [vim.diagnostic.severity.WARN] = 'DiagnosticLineWarn',
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Enhanced LspAttach configuration with more keymaps and better organization
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('runfridge-lsp', { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        -- Enable completion if supported
        if client and client.supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
        end

        -- Auto-formatting setup (exclude problematic servers)
        local excluded_formatters = { 'ts_ls', 'tsserver', 'volar' }
        if client and client.supports_method('textDocument/formatting') and
            not vim.tbl_contains(excluded_formatters, client.name) then
            local format_group = vim.api.nvim_create_augroup('lsp-format-' .. client.name, { clear = true })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = format_group,
                buffer = bufnr,
                callback = function()
                    -- Only format if buffer is still valid and attached
                    if vim.api.nvim_buf_is_valid(bufnr) and
                        vim.lsp.get_client_by_id(client.id) then
                        vim.lsp.buf.format({
                            bufnr = bufnr,
                            id = client.id,
                            timeout_ms = 3000,
                            async = false,
                        })
                    end
                end,
            })
        end

        -- Enhanced keymaps with descriptions and better organization
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Navigation
        map('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('n', 'gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        map('n', 'gt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')

        -- References (with telescope if available)
        map('n', 'gr', function()
            if pcall(require, 'telescope.builtin') then
                require('telescope.builtin').lsp_references()
            else
                vim.lsp.buf.references()
            end
        end, '[G]oto [R]eferences')

        -- Documentation and help
        map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
        map('i', '<C-h>', vim.lsp.buf.signature_help, 'Signature Help')

        -- Workspace symbols (with telescope fallback)
        map('n', '<leader>ws', function()
            if pcall(require, 'telescope.builtin') then
                require('telescope.builtin').lsp_dynamic_workspace_symbols()
            else
                vim.lsp.buf.workspace_symbol()
            end
        end, '[W]orkspace [S]ymbols')

        -- Document symbols
        map('n', '<leader>ds', function()
            if pcall(require, 'telescope.builtin') then
                require('telescope.builtin').lsp_document_symbols()
            else
                vim.lsp.buf.document_symbol()
            end
        end, '[D]ocument [S]ymbols')

        -- Diagnostics
        map('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
        map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')
        map('n', '[d', function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, 'Go to previous [D]iagnostic message')
        map('n', ']d', function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, 'Go to next [D]iagnostic message')

        -- Code actions
        map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Formatting
        map('n', '<leader>fm', function()
            vim.lsp.buf.format({
                bufnr = bufnr,
                timeout_ms = 3000,
                async = true
            })
        end, '[F]or[m]at buffer')

        -- Inlay hints toggle (if supported)
        if client and client.supports_method('textDocument/inlayHint') then
            map('n', '<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
            end, '[T]oggle Inlay [H]ints')
        end

        -- Codelens (if supported)
        if client and client.supports_method('textDocument/codeLens') then
            vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
                buffer = bufnr,
                callback = vim.lsp.codelens.refresh,
            })
            map('n', '<leader>cl', vim.lsp.codelens.run, '[C]ode [L]ens')
        end
    end,
})

-- Enhanced auto-load LSP configs with better error handling and logging
local function load_lsp_configs()
    local config_path = vim.fn.stdpath('config') .. '/lua/runfridge/lsp/config'

    -- Check if config directory exists
    if vim.fn.isdirectory(config_path) == 0 then
        vim.notify('LSP config directory not found: ' .. config_path, vim.log.levels.WARN)
        return
    end

    local config_files = vim.fn.glob(config_path .. '/*.lua', false, true)

    if #config_files == 0 then
        vim.notify('No LSP config files found in: ' .. config_path, vim.log.levels.INFO)
        return
    end

    local loaded_count = 0
    local failed_configs = {}

    for _, file in ipairs(config_files) do
        local server_name = vim.fn.fnamemodify(file, ':t:r')

        -- Skip non-LSP files
        if server_name:match('^_') or server_name == 'init' then
            goto continue
        end

        local ok, config = pcall(require, 'runfridge.lsp.config.' .. server_name)

        if ok and type(config) == 'table' then
            -- Validate config has required fields
            local success, err = pcall(function()
                vim.lsp.config(server_name, config)
                vim.lsp.enable(server_name)
            end)

            if success then
                loaded_count = loaded_count + 1
                vim.notify('✓ Loaded LSP config: ' .. server_name, vim.log.levels.INFO)
            else
                table.insert(failed_configs, { server_name, err })
                vim.notify('✗ Failed to configure LSP: ' .. server_name .. ' - ' .. tostring(err), vim.log.levels.ERROR)
            end
        else
            local error_msg = ok and 'Invalid config format' or tostring(config)
            table.insert(failed_configs, { server_name, error_msg })
            vim.notify('✗ Failed to load LSP config: ' .. server_name .. ' - ' .. error_msg, vim.log.levels.ERROR)
        end

        ::continue::
    end

    -- Summary
    vim.notify(string.format('LSP Setup Complete: %d loaded, %d failed', loaded_count, #failed_configs),
        vim.log.levels.INFO)

    -- Detailed error report if any failures
    if #failed_configs > 0 then
        vim.schedule(function()
            vim.notify('Failed LSP configurations:\n' ..
                table.concat(vim.tbl_map(function(item)
                    return '  • ' .. item[1] .. ': ' .. item[2]
                end, failed_configs), '\n'), vim.log.levels.WARN)
        end)
    end
end

-- Load configurations
load_lsp_configs()

-- Utility functions for manual LSP management
M.restart_lsp = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
        vim.notify('No LSP clients attached to current buffer', vim.log.levels.WARN)
        return
    end

    for _, client in ipairs(clients) do
        vim.notify('Restarting LSP: ' .. client.name, vim.log.levels.INFO)
        vim.cmd('LspRestart ' .. client.id)
    end
end

M.toggle_diagnostics = function()
    if vim.diagnostic.is_enabled() then
        vim.diagnostic.enable(false)
        vim.notify('Diagnostics disabled', vim.log.levels.INFO)
    else
        vim.diagnostic.enable(true)
        vim.notify('Diagnostics enabled', vim.log.levels.INFO)
    end
end

-- Additional keymaps for LSP management
vim.keymap.set('n', '<leader>lr', M.restart_lsp, { desc = '[L]SP [R]estart' })
vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>', { desc = '[L]SP [I]nfo' })
vim.keymap.set('n', '<leader>td', M.toggle_diagnostics, { desc = '[T]oggle [D]iagnostics' })

return M
