local M = {}

-- Detect if PATH (or CWD) is inside a Git repo by walking up to root.
-- Handles .git directories and worktree-style .git files.
function M.is_git_repo(path)
  local uv = vim.uv or vim.loop
  local function stat(p) return p and uv.fs_stat(p) or nil end

  local cur = vim.fn.fnamemodify(path or vim.fn.getcwd(), ":p")

  while cur and cur ~= "" do
    local s = stat(cur .. "/.git")
    if s and (s.type == "directory" or s.type == "file") then
      return true
    end
    local parent = vim.fn.fnamemodify(cur, ":h")
    if parent == cur then break end
    cur = parent
  end
  return false
end

-- Shallow merge; later keys override earlier ones.
function M.merge_table(t1, t2)
  return vim.tbl_extend("force", t1 or {}, t2 or {})
end

-- Deep merge; later keys override earlier ones.
function M.merge_deep(t1, t2)
  return vim.tbl_deep_extend("force", t1 or {}, t2 or {})
end

-- Return normalized OS name: "windows" | "linux" | "macos" | "unknown"
function M.get_os()
  local sys = (vim.uv or vim.loop).os_uname().sysname
  if not sys then return "unknown" end
  sys = sys:lower()
  if sys:match("windows") then return "windows" end
  if sys:match("linux")   then return "linux"   end
  if sys:match("darwin")  then return "macos"   end
  return "unknown"
end

-- Async command runner (uses vim.system if available, else jobstart)
function M.run_async(cmd)
    if vim.system then
        vim.system(cmd, { detach = true })
    else
        vim.fn.jobstart(cmd, { detach = true })
    end
end

return M
