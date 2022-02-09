-- ---------------
-- Get cmp module
-- ---------------
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    vim.notify("luasnip can not be required", "error")
    return
end

local text = luasnip.text_node
local insert = luasnip.insert_node

luasnip.snippets = {
    markdown = {
        luasnip.snippet({
            trig = "\\img", 
            namr = "image",
            dscr = "Create an HTML image tag"
        },
        {
            text('<img src="'),
            insert(1, 'source'),
            text('" style="width: '),
            insert(2, '100%'),
            text(';">'),
            text({ "", "", ""}),
            insert(0)
        })
    }
}
