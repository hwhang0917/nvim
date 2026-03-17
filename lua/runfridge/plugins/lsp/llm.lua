local ok, local_config = pcall(require, "runfridge.local")
if not ok then
    local_config = {}
end

return {
    "huggingface/llm.nvim",
    init = function()
        local orig = vim.lsp.util.make_position_params
        vim.lsp.util.make_position_params = function(window, position_encoding)
            position_encoding = position_encoding
                or vim.lsp.get_clients({ bufnr = 0 })[1].offset_encoding
                or "utf-16"
            return orig(window, position_encoding)
        end
    end,
    opts = {
        model = local_config.llm_model or "qwen2.5-coder:1.5b-base",
        backend = local_config.llm_backend or "ollama",
        url = local_config.llm_url or "http://localhost:11434",
        tokens_to_clear = { "<|endoftext|>" },
        request_body = {
            options = {
                temperature = 0.2,
                top_p = 0.95,
                num_predict = 60,
            },
        },
        fim = {
            enabled = true,
            prefix = "<|fim_prefix|>",
            middle = "<|fim_middle|>",
            suffix = "<|fim_suffix|>",
        },
        debounce_ms = 100,
        accept_keymap = "<C-c>",
        dismiss_keymap = "<S-Tab>",
    },
}
