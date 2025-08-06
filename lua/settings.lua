-- Leader
vim.g.mapleader = " "

vim.opt.tabstop = 4 -- Tabs and shift
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true -- Indents
vim.opt.wrap = false -- Wrap
vim.opt.ignorecase = true
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.autochdir = true
vim.opt.hlsearch = false -- Searching highlights
vim.opt.termguicolors = true -- Nice term colours
vim.opt.cursorline = true -- Cursor highlight line
vim.opt.signcolumn = "yes" -- Sign column next to lines
vim.opt.scrolloff = 10
vim.opt.winborder= "rounded"

vim.opt.foldenable = false
vim.opt.foldcolumn = '0'
vim.opt.foldtext = " "
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- Setttings to use Powershell, taken from toggleterm.nvim
vim.opt.shell = vim.fn.executable('pwsh') == 1 and 'pwsh -NoLogo' or 'powershell -NoLogo'
vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellxquote = ''
vim.opt.shellquote = ''
-- Fixes ANSI escape codes when using PS and :!, taken from https://github.com/ConnorSweeneyDev/.config/issues/2#issuecomment-2209443983
vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$PSStyle.Formatting.Error = '';$PSStyle.Formatting.ErrorAccent = '';$PSStyle.Formatting.Warning = '';$PSStyle.OutputRendering = 'PlainText';"
-- Check this issue to see if pwsh can finally be used with :te and no :te pwsh, https://github.com/neovim/neovim/issues/31494

-- Adds Prompt markers to shell, use [[ or ]] to navigate
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

