if (os.getenv("TMUX") ~= "") then

    vim.opt["showmode"] = false
    vim.opt["laststatus"] = 0
    vim.opt["cmdheight"] = 0

    vim.api.nvim_create_autocmd("FocusGained", { command = [[
    :lua require("configs.statusline").update()
    ]] })

    vim.api.nvim_create_autocmd("BufEnter", { command = [[
    :lua require("configs.statusline").update()
    ]] })

    vim.api.nvim_create_autocmd("ModeChanged", { command = [[
    :lua require("configs.statusline").update()
    ]] })

    vim.api.nvim_create_autocmd("FocusLost", { command = [[
    :silent !tmux set -g status-left ''
    :silent !tmux set -g status-right ''
    ]] })
    vim.api.nvim_create_autocmd("ExitPre", { command = [[
    :silent !tmux set -g status-left ''
    :silent !tmux set -g status-right ''
    ]] })

    local M = {}

    M.mode = {
        n = "normal",
        v = "visual",
        V = "v-line",
        i = "insert",
        c = "command",
    }

    M.getModeName = function()
        local mode = M.mode[vim.api.nvim_get_mode().mode]
        if mode ~= nil then
            return mode
        else
            return ""
        end
    end

    M.getFileName = function()
        local file = string.match(vim.api.nvim_buf_get_name(0), "^.*/(.*).*$")
        if file ~= nil then
            return file
        else
            return "<no name>"
        end
    end

    M.getBranchName = function()
        local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
        if branch ~= "" then
            return " " .. branch
        else
            return ""
        end
    end

    M.addElement = function(command, text, color)
        return command .. "\\#[bg=colour" .. color .. ", fg=black] " .. text .. " \\#[bg=colour" .. color - 3 .. ", fg=colour" .. color .. "]"
    end

    M.addElementLast = function(command, text, color)
        return command .. "\\#[bg=colour" .. color .. ", fg=black] " .. text .. " \\#[bg=default, fg=colour" .. color .. "]"
    end

    M.update = function()
        local command = ":silent !tmux set -g status-left '"
        local charCount = 0

        local mode = M.getModeName()
        local branch = M.getBranchName()
        local file = M.getFileName()
        local color = 246

        if mode ~= "" then
            command = M.addElement(command, mode, color)
            color = color - 3
            charCount = charCount + #mode + 3
        end
        if branch ~= "" then
            command = M.addElement(command, branch, color)
            color = color - 3
            charCount = charCount + #branch + 2
        end

        command = M.addElementLast(command, file, color)
        charCount = charCount + #file + 3

        vim.cmd(command .. "'")

        local text = ''
        for i = 1, charCount, 1 do
            text = text .. ' '
        end
        vim.cmd(":silent !tmux set -g status-right '" .. text .. "'")
    end

    return M

end
