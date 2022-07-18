local toggleterm = require("toggleterm")

toggleterm.setup({
    size = 20,
    open_mapping = [[<c-t>]],
    direction = "float",
    float_opts = {
        border = "curved",
    },

    winbar = {
        enable = false
    }
})
