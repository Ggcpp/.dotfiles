local M ={}

local function createBuffer()
    print("Creating buffer")
    vim.api.nvim_buf_attach(0, true, {})
end

M.start = function()
    print("start training")

    createBuffer()
end

return M
