-- Leader
vim.g.mapleader = " "

-- Cursor
-- Based on the default and another example in the docs, blinks when input and doesn't when no input
vim.opt.guicursor = "n-v-c-sm:block-Cursor/lCursor,i-ci-ve:block-blinkon300-blinkoff300-blinkwait10,r-cr-o:hor25,t:block-blinkon500-blinkoff500-TermCursor"
-- vim.opt.guicursor = ""

vim.opt.tabstop = 4 -- Tabs and shift
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smartindent = true -- Indents
-- vim.opt.autoindent = true -- Copy indent from current line
vim.opt.wrap = false -- Wrap
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true
vim.opt.backup = false -- Undos and backups
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.autowrite = false -- Auto save, read, change directory
vim.opt.autoread = true
vim.opt.autochdir = true
vim.opt.hlsearch = false -- Searching
vim.opt.incsearch = true
vim.opt.termguicolors = true -- Nice term colours
vim.opt.foldenable = false
vim.opt.foldcolumn = '0'
vim.opt.foldtext = "i"
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.cursorline = true -- Cursor highlight line
vim.opt.signcolumn = "yes" -- Sign column next to lines
vim.opt.scrolloff = 10
vim.opt.showcmd = true
vim.opt.errorbells = false -- No error bells
vim.opt.mouse = "a" -- Enable mouse
vim.opt.sessionoptions="blank,buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.winborder= "rounded"

-- Setttings to use Powershell, taken from toggleterm.nvim
vim.opt.shell = vim.fn.executable('pwsh') == 1 and 'pwsh -NoLogo' or 'powershell -NoLogo'
vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellxquote = ''
vim.opt.shellquote = ''
-- Fixes ANSI escape codes when using PS and :!, taken from https://github.com/ConnorSweeneyDev/.config/issues/2#issuecomment-2209443983
vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$PSStyle.Formatting.Error = '';$PSStyle.Formatting.ErrorAccent = '';$PSStyle.Formatting.Warning = '';$PSStyle.OutputRendering = 'PlainText';"
-- Hopefully they fix the path issue with this one day
-- vim.opt.shell = '"C:\\Program Files\\PowerShell\\7\\pwsh.exe" -NoLogo'

-- Adds Prompt markers to pwsh shell, use [[ or ]] to navigate
vim.api.nvim_create_autocmd('TermOpen', {
    command = 'setlocal signcolumn=auto',
})
local ns = vim.api.nvim_create_namespace('my.terminal.prompt')
vim.api.nvim_create_autocmd('TermRequest', {
    callback = function(args)
        if string.match(args.data.sequence, '^\027]133;A') then
            local lnum = args.data.cursor[1]
            vim.api.nvim_buf_set_extmark(args.buf, ns, lnum - 1, 0, {
                sign_text = '▶',
                sign_hl_group = 'SpecialChar',
            })
        end
    end,
})

-- Augroup and Autocmd for setting wrapping in Markdown files
vim.cmd(" augroup md_augroup | autocmd BufEnter *.md set wrap | autocmd BufLeave *.md set nowrap")

-- Colourscheme
vim.cmd('colorscheme nanos')

