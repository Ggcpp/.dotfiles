local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme '" .. colorscheme .. "' not found!")
    return
end

-- Vertical bar color: red (gruvbox)
vim.cmd("highlight ColorColumn guibg=#cc241d")
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight SignColumn guibg=none")
