-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Cursor
-- vim.opt.guicursor = ""
-- Based on the default and another example in the docs, blinks when input and doesn't when no input
vim.opt.guicursor = "n-v-c-sm:block-Cursor/lCursor,i-ci-ve:block-blinkon300-blinkoff300-blinkwait10,r-cr-o:block,t:block-blinkon500-blinkoff500-TermCursor"

-- Tabs and shift
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.shiftround = true

-- Indents
vim.opt.smartindent = true
vim.opt.autoindent = true   -- Copy indent from current line

-- Wrap
vim.opt.wrap = false

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Undos and backups
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Auto save, read, change directory
vim.opt.autowrite = false
vim.opt.autoread = true
vim.opt.autochdir = true

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Nice term colours
vim.opt.termguicolors = true

-- Folding
vim.o.foldenable = true
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.opt.foldmethod = "expr" -- Use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding

-- Fast update time
vim.opt.updatetime = 50

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

vim.opt.colorcolumn = "" -- Column for X character mark
vim.opt.cursorline = true -- Cursor highlight line
vim.opt.signcolumn = "yes" -- Sign column next to lines
vim.opt.scrolloff = 10
vim.opt.showcmd = true
vim.opt.laststatus = 2

vim.opt.errorbells = false -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.path:append("**") -- Include subdirectories in search
-- vim.opt.selection = "exclusive" -- Visual mode selection behavior
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.modifiable = true -- Allow buffer modifications
vim.opt.encoding = "UTF-8" -- Set encoding

vim.opt.sessionoptions="blank,buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.winborder= "shadow"

-- Hopefully they fix the path issue with this one day
-- vim.opt.shell = '"C:\\Program Files\\PowerShell\\7\\pwsh.exe" -NoLogo'

-- Setttings to use Powershell, taken from toggleterm.nvim
vim.opt.shell = vim.fn.executable('pwsh') == 1 and 'pwsh -NoLogo' or 'powershell -NoLogo'
vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellxquote = ''
vim.opt.shellquote = ''

-- Fixes ANSI escape codes when using PS and :!, taken from https://github.com/ConnorSweeneyDev/.config/issues/2#issuecomment-2209443983
vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$PSStyle.Formatting.Error = '';$PSStyle.Formatting.ErrorAccent = '';$PSStyle.Formatting.Warning = '';$PSStyle.OutputRendering = 'PlainText';"

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

