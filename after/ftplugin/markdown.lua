vim.wo.wrap = true -- Enable wrap for current .md window
vim.diagnostic.enable(false, { bufnr = 0 }) -- Disable diagnostics for current .md buffer

-- Simulate the map gf :e <cfile>.md<CR> so that it works with spaces
-- Must also remove [[ ]] to make Wikilinks work on Windows
local open_md_file_wikilink = function ()
    local cursor_pos = 0
    local line = vim.api.nvim_get_current_line()
    local current_col = vim.fn.col('.')
    -- Get the current cursor position that is closest to the [[link]]
    -- This is to prevent issues with multiple links in one line
    for i = 0, #line do
        local cc = line:sub(i, i + 1)
        if cc == "[[" and i < current_col then
            cursor_pos = i - 1
        end
    end
    local file = string.match(line, "%[%[(.-)%]%]", cursor_pos)
    if file then
        vim.cmd('edit ' .. file .. '.md')
    end
end

local insert_hyperlink = function ()
    vim.api.nvim_input('s[](<ESC>"+pa)<ESC>F[p')
end

local delete_hyperlink = function ()
    vim.api.nvim_input('di[F[vf)p')
end

vim.keymap.set('n', 'gf', function()
    open_md_file_wikilink()
end, { desc = "Open markdown file from Wikilink", buffer = true, })

vim.keymap.set("v", '<C-K>', function()
    insert_hyperlink()
end, { desc = "Insert hyperlink", buffer = true, })

vim.keymap.set("n", '<C-K>', function()
    delete_hyperlink
end, { desc = "Delete hyperlink", buffer = true, })

