-- --------------------
-- Get markdown module
-- --------------------
local status_ok, _ = pcall(require, "cmp")
if not status_ok then
    vim.notify("markdown-preview can not be required", "error")
    return
end

vim.g.mkdp_auto_start = 1
--vim.g.mkdp_markdown_css = "~/pdf/style.css"
--vim.g.mkdp_highlight_css = "~/pdf/style.css"
