-- ---------------
-- Get cmp module
-- ---------------
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    vim.notify("luasnip can not be required", "error")
    return
end

local snip = luasnip.snippet
local text = luasnip.text_node
local insert = luasnip.insert_node

luasnip.snippets = {
    markdown = {
        snip({
            trig = "/img", 
            namr = "image",
            dscr = "Create an HTML image tag."
        },
        {
            text('<img src="'),
            insert(1, 'source'),
            text('" style="width: '),
            insert(2, '100%'),
            text(';">'),
            text({ "", "", ""}),
            insert(0)
        }),

        snip({
            trig = "/imgleft",
            namr = "image left",
            dscr = "Create an HTML image tag floating left."
        },
        {
            text('<img class="image-left" src="'),
            insert(1, 'source'),
            text('" style="width: '),
            insert(2, '100%'),
            text(';">'),
            text({ "", "", ""}),
            insert(0)
        }),

        snip({
            trig = "/imgright",
            namr = "image right",
            dscr = "Create an HTML image tag floating right."
        },
        {
            text('<img class="image-right" src="'),
            insert(1, 'source'),
            text('" style="width: '),
            insert(2, '100%'),
            text(';">'),
            text({ "", "", ""}),
            insert(0)
        }),

        snip({
            trig = "/link",
            namr = "link",
            dscr = "Create a link in markdown syntax."
        },
        {
            text("["),
            insert(1, "link text"),
            text("]("),
            insert(2, "link"),
            text(")"),
            text({"", "", ""}),
            insert(0)
        })
    }
}
