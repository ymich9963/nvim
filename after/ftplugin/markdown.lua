vim.wo.wrap = true -- Enable wrap for current .md window
vim.diagnostic.enable(false, { bufnr = 0 }) -- Disable diagnostics for current .md buffer

-- Simulate the map gf :e <cfile>.md<CR> so that it works with spaces
local open_md_file_wikilink = function()
    local line = vim.api.nvim_get_current_line()
    local current_col = vim.fn.col('.')

    for start_pos, file ,end_pos in line:gmatch("()(%[%[(.-)%]%])()") do
        if start_pos < current_col and end_pos > current_col then
            vim.cmd('edit ' .. file .. '.md')
        end
    end
end

local check_md_link = function()
    local line = vim.api.nvim_get_current_line()
    local current_col = vim.fn.col('.')

    for start_pos, links, end_pos in line:gmatch("()(%[[^%]]+%]%([^%)]+%)())") do
        if start_pos < current_col and end_pos > current_col then
            return true
        end
    end

    return false
end

local insert_hyperlink = function()
    local reg = vim.fn.getreg('+')

    -- Set if empty
    if reg == '' then
        vim.fn.setreg('+','"+ register empty')
    end

    -- Sanitize text to prevent chaos
    vim.fn.setreg('+', reg:gsub("[%c]", ""))

    -- TODO: Make this better
    vim.api.nvim_input('s[](<ESC>"+pa)<ESC>F[p')
end

local delete_hyperlink = function()
    -- TODO: Make this better
    vim.api.nvim_input('di[F[vf)p')
end

local toggle_hyperlink = function()
    if check_md_link() then
        delete_hyperlink()
    else
        insert_hyperlink()
    end
end

vim.keymap.set('n', 'gf', function()
    open_md_file_wikilink()
end, { desc = "Open markdown file from Wikilink", buffer = true, })

vim.keymap.set({"v", "n"}, '<C-K>', function()
    toggle_hyperlink()
end, { desc = "Toggle hyperlink", buffer = true, })

