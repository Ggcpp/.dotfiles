local function refresh()
    local timer = vim.loop.new_timer()
    timer:start(0, 500, vim.schedule_wrap(function()
        local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false), "\n")
        os.execute("pandoc --no-highlight --metadata title='Auto Generated' -c style.css -s -o ~/.cache/nvim/index.html <<<'" .. content .. "'")
    end))
end

local function initHideForNow()
    local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false), "\n")
    os.execute("pandoc --no-highlight --metadata title='Auto Generated' -c style.css -s -o ~/.cache/nvim/index.html <<<'" .. content .. "'")
    os.execute("live-server ~/.cache/nvim/ &")

    refresh()
end

local function stop()
    os.execute("fg && ^C")
end

-------------------------------------------------------------------------------------

local function execTerminal(cmd)
    local handle = io.popen(cmd)
    local output = handle:read("*a")
    handle:close()

    return output
end

local function getCurrentFilePath()
    return vim.api.nvim_exec(":echo expand('%:p')", true)
end

local function getBufferContent()
    return table.concat(vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false), "\n")
end

local function init()
    vim.notify(_VERSION)
    local http = require("socket.http")
    local ltn12 = require("ltn12")
    local str = "testo my friendo"
    local response = {}
    local base_url = "http://127.0.0.1:8080"

    local result, respcode, respheaders, respstatus = http.request {
        method = "POST",
        url = base_url,
        headers = {
            ["content-type"] = "text/plain",
            ["content-length"] = string.len(str)
        },
        source = ltn12.source.string(str),
        sink = ltn12.sink.table(response)
    }

    -- TODO: include <script> for implement ajax in <head>
    vim.notify(execTerminal("pandoc --no-highlight --metadata title='Auto Generated' <<<'" .. getBufferContent() .. "' -c style.css -s"))

    -- run "update()" on every cursor movement in insert mode.
    vim.cmd [[
        :autocmd CursorMovedI *.md :lua dofile(vim.fn.stdpath("config") .. "/lua/user/markdown-preview.lua").update()
    ]]
end

local function update()
    vim.notify(execTerminal("pandoc --no-highlight --metadata title='Auto Generated' <<<'" .. getBufferContent() .. "' -c style.css -s"))
end

return {
    init = init,
    update = update
}
