local utils = require("runfridge.utils")
local api, fn, uv = vim.api, vim.fn, (vim.uv or vim.loop)

-- ---------- IME switching ----------
local last_switch_ns = 0
local function throttle_ms(ms)
  local now = uv.hrtime()
  if now - last_switch_ns < ms * 1e6 then return true end
  last_switch_ns = now
  return false
end

local function switch_ime_to_english()
  if throttle_ms(200) then return end
  if vim.env.SSH_TTY then return end
  if fn.has("wsl") == 1 then return end

  if fn.executable("ibus") == 1 then           -- IBus
    utils.run_async({ "ibus", "engine", "xkb:us::eng" })
    return
  end

  if fn.executable("fcitx5-remote") == 1 then  -- Fcitx5
    utils.run_async({ "fcitx5-remote", "-s", "keyboard-us" })
    return
  end

  -- Add more IMEs here (fcitx-remote for fcitx4, macOS im-select, etc.)
end

api.nvim_create_autocmd("InsertLeave", { callback = switch_ime_to_english })

-- ---------- Trim trailing whitespace on save ----------
local trim_grp = api.nvim_create_augroup("TrimTrailingWhitespace", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  group = trim_grp,
  callback = function(ev)
    local bo = vim.bo[ev.buf]
    if not bo.modifiable or bo.readonly then return end
    if bo.buftype ~= "" then return end        -- skip special buffers (nofile, terminal, etc.)
    if bo.binary or vim.wo.diff then return end

    local cur = api.nvim_win_get_cursor(0)
    vim.cmd([[keepjumps keeppatterns silent! %s/\s\+$//e]])
    pcall(api.nvim_win_set_cursor, 0, cur)
  end,
})

-- ---------- Yank highlight ----------
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 120 })
  end,
})

