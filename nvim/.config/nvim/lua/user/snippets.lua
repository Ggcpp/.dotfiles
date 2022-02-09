-- ---------------
-- Get cmp module
-- ---------------
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    vim.notify("luasnip can not be required", "error")
    return
end

luasnip.snippets = {
    md = {
        snip({
            trig = "/img", 
            namr = "image",
            dscr = "Create an HTML image tag"
        },
        {
            text({'<img src="nothing.png">'}), insert(0)
        })
    }
}
