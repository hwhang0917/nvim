local operating_system = GetOS()

if operating_system == "windows" then
	vim.opt.shell = "cmd.exe"
	vim.opt.shellcmdflag = "/c"
end

vim.opt.guicursor = ""
vim.opt.mouse = ""

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

if operating_system == "windows" then
	vim.opt.undodir = os.getenv("USERPROFILE") .. "/.vim/undodir"
else
	vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
