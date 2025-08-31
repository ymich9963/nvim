vim.g.mapleader = " " -- Leader
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 1 -- wide style with ls
vim.g.netrw_banner = 0
vim.opt.splitbelow = true -- Keeps the below window when splitting or quiting
vim.opt.equalalways = false -- Does not make windows equal automatically
vim.opt.tabstop = 4 -- Tabs and shift
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true -- Indents
vim.opt.wrap = false -- Wrap
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.hlsearch = false -- Searching highlights
vim.opt.termguicolors = true -- Nice term colours
vim.opt.cursorline = true -- Cursor highlight line
vim.opt.signcolumn = "yes" -- Sign column next to lines
vim.opt.scrolloff = 10
vim.opt.winborder= "rounded"
vim.opt.path:append{"**"} -- Use :find for all subdirectories
vim.opt.completeopt:append{"fuzzy"} -- Fuzzy completion
vim.opt.wildoptions:append{"fuzzy"} -- Fuzzy wild menu
vim.opt.foldenable = false
vim.opt.foldcolumn = '0'
vim.opt.foldtext = " "
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.shell = vim.fn.executable('pwsh') == 1 and 'pwsh -NoLogo' or 'powershell -NoLogo' -- Setttings to use Powershell, taken from toggleterm.nvim
vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellxquote = ''
vim.opt.shellquote = ''
-- Fixes ANSI escape codes when using PS and :!, taken from https://github.com/ConnorSweeneyDev/.config/issues/2#issuecomment-2209443983
vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$PSStyle.Formatting.Error = '';$PSStyle.Formatting.ErrorAccent = '';$PSStyle.Formatting.Warning = '';$PSStyle.OutputRendering = 'PlainText';"
-- Check this issue to see if pwsh can finally be used with :te and no :te pwsh, https://github.com/neovim/neovim/issues/31494

vim.cmd('colorscheme nanos') -- Colourscheme
