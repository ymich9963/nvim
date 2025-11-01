--NVIM-CONFIG--

-- SETTINGS ---
vim.g.mapleader = " " -- Leader
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 1 -- wide style with ls
vim.g.netrw_banner = 0
vim.g.netrw_special_syntax = true
vim.opt.splitbelow = true -- Keeps the below window when splitting or quiting
vim.opt.equalalways = false -- Does not make windows equal automatically
vim.opt.tabstop = 4 -- Tabs and shift
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true -- Indents
vim.opt.wrap = false -- Wrap
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.termguicolors = true -- Nice term colours
vim.opt.cursorline = true -- Cursor highlight line
vim.opt.signcolumn = "yes" -- Sign column next to lines
vim.opt.scrolloff = 10
vim.opt.winborder= "rounded"
vim.opt.path:append{"**"} -- Use :find for all subdirectories
vim.opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }
vim.opt.wildoptions:append{"fuzzy"} -- Fuzzy wild menu
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

vim.cmd('colorscheme nanos') -- Colourscheme
--END-SETTINGS---

--REMAPS--
vim.keymap.set("n", "<C-i>", "gg=G``", {desc = "Auto-indent and go back to position"})                                                      -- 
vim.keymap.set("n", "<leader>re", ":%s/<C-R><C-W>/", {desc = "Shortcut to replace current word under cursor"})
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", {desc = "Escape the terminal and go back to normal mode"})
vim.keymap.set("n", "<leader>o", ":Explore .<CR>", {desc = "Netrw explore from cwd"})
vim.keymap.set("n", "<leader>O", ":Explore <CR>", {desc= "Netrw explore from file directory"})
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]], {desc = "Paste from system clipboard"})
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Copy to system clipboard"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")                                                -- Move a selection up or down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")                                                           -- Append line and cursor remains in the same place
vim.keymap.set("n", "n", "nzzzv")                                                           -- Keep cursor in the middle when searching
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })                      -- Better indenting in visual mode
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })        -- Resizing
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

--END-REMAPS--

--PLUGINS--

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "mason-org/mason.nvim", opts = {} },
        { "neovim/nvim-lspconfig" },
        { "jiaoshijie/undotree", keys = { {"<leader>ut", "<cmd>lua require('undotree').toggle()<cr>", "n", desc = "Toggle Undotree"}, }, },
        { "NvChad/nvim-colorizer.lua", lazy = true, opts = {}, cmd= {"ColorizerToggle"} },
        { "tpope/vim-fugitive", cmd = {"Git"} },
        {
            'rmagatti/auto-session',
            lazy = false,
            opts = {
                suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
                lazy_support = true,
                auto_restore = false, -- Enables/disables auto restoring session on start
                auto_create = false, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
                auto_restore_last_session = false, -- On startup, loads the last saved session if session for cwd does not exist
            },
            keys = {
                { "<leader>sl", ":AutoSession search<CR>", desc = "List sessions", },
                { "<leader>ss", ":AutoSession save", desc = "Save session", },
                { "<leader>sd", ":AutoSession delete", desc = "Delete session", },
                { "<leader>sr", ":AutoSession restore", desc = "Restore session", },
            },
        },
        {
            'OXY2DEV/markview.nvim',
            lazy = false,
        },
        {
            'brianhuster/live-preview.nvim',
            opts = {
                port = 55555,
            },
            cmd = {"LivePreview"}
        },
        {
            "danymat/neogen",
            opts = {
                enabled = true,
                languages = {
                    python = {
                        template = {
                            annotation_convention = "reST"
                        }
                    },
                }
            },
            lazy = true,
            cmd = { "Neogen" },
        },
        {
            "nvim-treesitter/nvim-treesitter",
            branch = "main",
            lazy = false,
            build = ":TSUpdate",
        },
        {
            "nvim-treesitter/nvim-treesitter-context",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
            },
            event = 'BufEnter',
            opts =  {
                max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
            }
        },
        {
            dir = vim.fn.stdpath("data") .. "/../mdnotes.nvim",
            opts = {
                assets_path = "./assets"
            }
        },
    }
})

vim.cmd('packadd nohlsearch') -- Automatically turn off search highlighting
--END-PLUGINS--

--LSP--
vim.lsp.config("clangd", {
    cmd = {vim.fn.stdpath("data") .. "/mason/bin/clangd.cmd", "--header-insertion=never"}
})
vim.lsp.enable("clangd")

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    '${3rd}/luv/library'
                }
            },
        },
    },
})
vim.lsp.enable("lua_ls")

vim.lsp.config("powershell_es", {})
vim.lsp.enable("powershell_es")

vim.lsp.config("vimls", {})
vim.lsp.enable("vimls")

vim.lsp.config("pyright", {})
vim.lsp.enable("pyright")

vim.lsp.config("markdown_oxide", {})
vim.lsp.enable("markdown_oxide")

-- LSP diagnostics config
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

-- Builtin completion
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end
        if client:supports_method("textDocument/completion") then
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable( true, client.id, ev.buf,
            {
                autotrigger = true,
                convert = function(item)
                    local abbr = item.label
                    abbr = #abbr > 30 and abbr:sub(1, 29) .. "…" or abbr

                    local menu = item.detail or ""
                    menu = #menu > 30 and menu:sub(1, 29) .. "…" or menu

                    return { abbr = abbr, menu = menu }
                end
            })
        end

        -- Documentation formatting when using auto-completion
        if client:supports_method("completionItem/resolve") then
            local _, cancel_prev = nil, function() end
            vim.api.nvim_create_autocmd("CompleteChanged", { buffer = ev.buf,
            callback = function(event)
                cancel_prev()

                local info = vim.fn.complete_info({ "selected" })
                local completionItem = vim.tbl_get(vim.v.completed_item, "user_data", "nvim", "lsp", "completion_item")
                if not completionItem then
                    return
                end

                _, cancel_prev = vim.lsp.buf_request( event.buf, vim.lsp.protocol.Methods.completionItem_resolve, completionItem,
                function(err, item, ctx)
                    if not item then
                        return
                    end

                    local docs = (item.documentation or {}).value
                    local win = vim.api.nvim__complete_set(info["selected"], { info = docs })
                    if win.winid and vim.api.nvim_win_is_valid(win.winid) then
                        vim.treesitter.start(win.bufnr, "markdown")
                        vim.wo[win.winid].conceallevel = 3
                    end
                end)
            end})
        end
    end
})
--END-LSP--

--AUTOCOMMANDS--
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local treesitter = require('nvim-treesitter')
        local lang = vim.treesitter.language.get_lang(args.match)
        if vim.list_contains(treesitter.get_available(), lang) then
            if not vim.list_contains(treesitter.get_installed(), lang) then
                treesitter.install(lang):wait()
            end
            vim.treesitter.start(args.buf)
        end
    end,
    desc = "Enable nvim-treesitter and install parser if not installed"
})

vim.api.nvim_create_autocmd("WinEnter", {
    pattern = { "*" },
    group = vim.api.nvim_create_augroup("SpecialComments", { clear = true }),
    callback = function()
        vim.fn.matchadd("TODO", 'TODO:')
        vim.fn.matchadd("INFO", 'INFO:')
        vim.fn.matchadd("FIX", 'FIX:')
        vim.fn.matchadd("BUG", 'BUG:')
    end,
    desc = "Make the matches for the nanos colorscheme Special Comments at every window"
})
--END-AUTOCOMMANDS--

--COMMANDS--
vim.api.nvim_create_user_command('DeleteInactiveBuffers',
function()
    local notify = false
    local number = 0
    for _, buf in ipairs(vim.fn.getbufinfo()) do
        if vim.tbl_isempty(buf.windows) and buf.listed == 1 and buf.changed == 0 then
            notify = true
            number = number + 1
            vim.cmd.bdelete({ buf.bufnr, bang = true })
        end
    end
    if notify then
        vim.notify('Deleted ' .. tostring(number) .. ' inactive buffer(s).', vim.log.levels.INFO)
    else
        vim.notify('No inactive buffers were deleted.', vim.log.levels.INFO)
    end
end,
{ desc = 'Delete listed unmodified buffers that are not in a window' })

vim.api.nvim_create_user_command('InsertDate',
function()
    vim.cmd([[put =strftime('%a %d %b %Y')]])
end,
{ desc = 'Insert date' })
--END-COMMANDS--
