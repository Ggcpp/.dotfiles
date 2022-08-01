local options = {
    number          = true,
    relativenumber  = true,
    tabstop         = 4,
    shiftwidth      = 4,
    softtabstop     = 4,
    expandtab       = true,
    smartindent     = true,
    hidden          = true,
    swapfile	    = false,
    hlsearch        = false,
    --scrolloff       = 10,
    scrolloff       = math.floor(vim.api.nvim_win_get_height(0) / 3),
    signcolumn      = "yes:1",
    syntax          = "enable",
    termguicolors   = true,
    cursorline      = false,
    wrap            = false,
    colorcolumn     = "80",
    cmdheight       = 1
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
