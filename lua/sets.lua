vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.opt.autochdir = true
-- vim.opt.colorcolumn = "80"

-- Setttings to use Powershell 
vim.opt.shell = '"C:\\Program Files\\PowerShell\\7\\pwsh.exe" -NoLogo'
vim.opt.shellcmdflag = '-NoProfile -ExecutionPolicy RemoteSigned -Command'
vim.opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
vim.opt.shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
vim.opt.shellxquote = ''
vim.opt.shellquote = ''
-- vim.opt.shellcmdflag = '-ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues["Out-File:Encoding"]="utf8";Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
-- vim.g.compiler_gcc_ignore_unmatched_lines = true

vim.cmd('colorscheme nanos')
