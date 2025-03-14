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
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.opt.shell = '"C:\\Program Files\\PowerShell\\7\\pwsh.exe" -NoLogo'
vim.opt.autochdir = true
-- vim.opt.colorcolumn = "80"

vim.cmd('colorscheme nanos')

-- Folding without UFO
--[[ vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = '0'
vim.opt.fillchars = 'fold: ,foldopen:,foldsep: ,foldclose:'
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.o.foldlevel = 99

function _G.MyFoldText()
    return vim.fn.getline(vim.v.foldstart) .. ' ... ' .. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
end

vim.opt.foldtext = 'v:lua.MyFoldText()' ]]
