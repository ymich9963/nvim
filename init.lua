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

-- Check this issue to see if pwsh can finally be used with :te and no :te pwsh, https://github.com/neovim/neovim/issues/31494
vim.opt.shell = 'pwsh'
vim.opt.shellcmdflag = "-NoLogo -NoProfile -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering = 'PlainText';";
vim.opt.shellpipe  = '> %s 2>&1'
vim.opt.shellxquote = ''
vim.opt.shellquote = ''
vim.opt.shelltemp = false
vim.env.__SuppressAnsiEscapeSequences=1

vim.cmd('colorscheme nanos') -- Colourscheme
--END-SETTINGS---

--REMAPS--
vim.keymap.set("n", "<C-i>", "gg=G``", {desc = "Auto-indent and go back to position"})
vim.keymap.set("n", "<leader>re", ":%s/<C-R><C-W>/", {desc = "Shortcut to replace current word under cursor"})
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", {desc = "Escape the terminal and go back to normal mode"})
vim.keymap.set("n", "<leader>o", ":Explore .<CR>", {desc = "Netrw explore from cwd"})
vim.keymap.set("n", "<leader>O", ":Explore <CR>", {desc= "Netrw explore from file directory"})
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]], {desc = "Paste from system clipboard"})
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Copy to system clipboard"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move a selection down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move a selection up"})
vim.keymap.set("n", "J", "mzJ`z", {desc = "Append line and cursor remains in the same place"})
vim.keymap.set("n", "n", "nzzzv", {desc = "Keep cursor in the middle when searching"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Keep cursor in the middle when searching"})
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
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
    dev = {
        path = "~/AppData/Local/"
    },
    spec = {
        { "mason-org/mason.nvim", opts = {} },
        { "neovim/nvim-lspconfig" },
        { "jiaoshijie/undotree", keys = { {"<leader>ut", "<cmd>lua require('undotree').toggle()<cr>", "n", desc = "Toggle Undotree"}, }, },
        { "catgoose/nvim-colorizer.lua", lazy = true, opts = {}, cmd= {"ColorizerToggle"} },
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
            "ymich9963/mdnotes.nvim",
            opts = {
                assets_path = "assets",
                default_keymaps = true,
            },
            dev = true
        },
    }
})

vim.cmd('packadd nohlsearch') -- Automatically turn off search highlighting
--END-PLUGINS--

--LSP--
-- Names must be Mason package names
local ensure_installed = {
    "clangd",
    "lua-language-server",
    "markdown-oxide",
    "neocmakelsp",
    "powershell-editor-services",
    "pyright",
    "rstcheck"
}

local installed_package_names = require('mason-registry').get_installed_package_names()
for _, v in ipairs(ensure_installed) do
    if not vim.tbl_contains(installed_package_names, v) then
        vim.cmd(":MasonInstall " .. v)
    end
end

vim.lsp.config("clangd", {
    cmd = {vim.fn.stdpath("data") .. "/mason/bin/clangd.cmd", "--header-insertion=never"}
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    '${3rd}/luv/library'
                }
            },
        },
    },
    on_attach = function ()
        vim.api.nvim_set_hl(0, '@lsp.type.variable.lua', {})
    end
})

-- From https://www.reddit.com/r/neovim/comments/1p0a576/comment/nphwtrg
local installed_packages = require("mason-registry").get_installed_packages()
local installed_lsp_names = vim.iter(installed_packages):fold({}, function(acc, pack)
    table.insert(acc, pack.spec.neovim and pack.spec.neovim.lspconfig)
    return acc
end)

vim.lsp.enable(installed_lsp_names)

-- LSP diagnostics config
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

--END-LSP--

--AUTOCOMMANDS--
local config_augroup = vim.api.nvim_create_augroup("Config", { clear = true })

-- Builtin LSP autocompletion
-- From https://www.reddit.com/r/neovim/comments/1mhusus/comment/n733xp9
vim.api.nvim_create_autocmd("LspAttach", {
    group = config_augroup,
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then return end

        -- Autocompletion
        if client:supports_method("textDocument/completion") then
            -- These three lines here are for auto-triggering on any keypress, I am unsure if I want this or not
            -- local chars = {}
            -- for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars
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
            vim.api.nvim_create_autocmd("CompleteChanged", {
                group = config_augroup,
                buffer = ev.buf,
                callback = function(event)
                    cancel_prev()
                    local info = vim.fn.complete_info({ "selected" })
                    local completionItem = vim.tbl_get(vim.v.completed_item, "user_data", "nvim", "lsp", "completion_item")
                    if not completionItem then return end
                    cancel_prev = vim.lsp.buf_request_all( event.buf, vim.lsp.protocol.Methods.completionItem_resolve, completionItem,
                    function(results)
                        if not results then return end
                        for _, v in ipairs(results) do
                            local item = v.result
                            local docs = (item.documentation or {}).value
                            local win = vim.api.nvim__complete_set(info["selected"], { info = docs })
                            if win.winid and vim.api.nvim_win_is_valid(win.winid) then
                                vim.treesitter.start(win.bufnr, item.documentation.kind)
                                vim.wo[win.winid].conceallevel = 3
                            end
                        end
                    end)
                end,
            })
        end
    end
})

-- From https://github.com/nvim-treesitter/nvim-treesitter/issues/8221#issuecomment-3436658280
vim.api.nvim_create_autocmd("FileType", {
    group = config_augroup,
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
    group = config_augroup,
    callback = function()
        vim.fn.matchadd("TODO", 'TODO:')
        vim.fn.matchadd("INFO", 'INFO:')
        vim.fn.matchadd("FIX", 'FIX:')
        vim.fn.matchadd("BUG", 'BUG:')
    end,
    desc = "Make the matches for the nanos colorscheme Special Comments at every window"
})

vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
    group = config_augroup,
    pattern = { '*' },
    callback = function()
        local status = 0
        for _, f in ipairs(vim.fn.globpath(vim.fn.stdpath('data') .. '/shada', '*tmp*', false, true)) do
            if vim.tbl_isempty(vim.fn.readfile(f)) then
                status = status + vim.fn.delete(f)
            end
        end
        if status ~= 0 then
            vim.notify('Could not delete empty temporary ShaDa files.', vim.log.levels.ERROR)
            vim.fn.getchar()
        end
    end,
    desc = "Delete empty temp ShaDa files"
})
--END-AUTOCOMMANDS--

--COMMANDS--
vim.api.nvim_create_user_command('DeleteInactiveBuffers', function()
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

vim.api.nvim_create_user_command('InsertLastMessage', function()
    local messages = vim.split(vim.fn.execute('messages'), "\n")
    vim.api.nvim_put({messages[#messages]}, "c", false, false)
end,
{ desc = 'Insert the last message from :messages' })
--END-COMMANDS--
