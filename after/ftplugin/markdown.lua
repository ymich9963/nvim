vim.wo.wrap = true

-- Simulate the map gf :e <cfile>.md<CR> so that it works with spaces
-- Must also remove [[ ]] to make Wikilinks work on WIndows
vim.keymap.set('n', 'gf', function()
    local index = 0
    local line = vim.api.nvim_get_current_line()
    local current_col = vim.fn.col('.')
    for i = 0, #line do
        local cc = line:sub(i,i + 1)
        if cc == "[[" and i < current_col then
            index = i - 1
        end
    end
    local file = string.match(line,"%[%[(.-)%]%]",index)
    if file then
        vim.cmd('edit ' .. file .. '.md')
    end
end, { desc = "Open markdown file from Wikilink" })
