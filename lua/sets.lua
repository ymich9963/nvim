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
vim.opt.sessionoptions="blank,buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions"

-- Forgot what this does
-- vim.opt.colorcolumn = "80"

-- Hopefully they fix the path issue with this one day
-- vim.opt.shell = '"C:\\Program Files\\PowerShell\\7\\pwsh.exe" -NoLogo'

-- Setttings to use Powershell, taken from toggleterm.nvim
vim.opt.shell = vim.fn.executable('pwsh') == 1 and 'pwsh -NoLogo' or 'powershell -NoLogo'
vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellxquote = ''
vim.opt.shellquote = ''

-- Something to do with quickfix menu not working
-- vim.g.compiler_gcc_ignore_unmatched_lines = true

-- Augroup and Autocmd for setting wrapping in Markdown files
vim.cmd(" augroup md_augroup | autocmd BufEnter *.md set wrap")

vim.cmd('colorscheme nanos')

