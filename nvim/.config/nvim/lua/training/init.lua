local M = {}

-- Maybe it should only be instanciated in createBuffer
local wordList = require("training.word_list")

local bufferWordList = {}

-- Return a buffer handle
local function createBuffer()
    local bufh = vim.api.nvim_create_buf(false, true)

    local height = vim.api.nvim_win_get_height(0)

    for line = 0, height - 1 do
        local words = {}

        for _ = 1, 10 do
            local random = math.random(1, #wordList)
            table.insert(words, wordList[random] .. ' ')
        end

        vim.api.nvim_buf_set_lines(bufh, line, line, false, {table.concat(words)})
        table.insert(bufferWordList, words)
    end

    return bufh
end

local function createWindow(bufh)
    return vim.api.nvim_open_win(bufh, true, {
        relative = "win",
        width = vim.api.nvim_win_get_width(0),
        height = vim.api.nvim_win_get_height(0),
        row = 0,
        col = 0,
        border = "none",
        relative = "editor",
    })
end

local function getColToMatch()
    local height = vim.api.nvim_win_get_height(0)
    -- Since we have ten words per line
    local randomWord = math.random(1, 10)
    local randomLine = math.random(1, height)

    local _, col = unpack(vim.fn.searchpos(bufferWordlist[randomLine][randomWord], 'n', randomLine))

    return col
end

M.start = function()
    local bufh = createBuffer()
    local win = createWindow(bufh)

    local match = vim.fn.matchaddpos("Search", {{getColToMatch()}})
    -- modify lightspeed plugin to change last touch to be efficient with dwarf
    -- vim.fn.matchdelete(match)
end

return M
