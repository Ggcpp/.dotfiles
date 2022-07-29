if (os.getenv("TMUX") ~= "") then

    vim.opt["showmode"] = false

    vim.api.nvim_create_autocmd("FocusGained", { command = [[
    :lua require("configs.statusline").update()
    ]] })

    vim.api.nvim_create_autocmd("FocusLost", { command = [[
    :silent !tmux set -g status-left ''
    ]] })
    vim.api.nvim_create_autocmd("ExitPre", { command = [[
    :silent !tmux set -g status-left ''
    ]] })

    vim.api.nvim_create_autocmd("ModeChanged", { command = [[
    :lua require("configs.statusline").update()
    ]] })

    local M = {}

    M.mode = {
        n = "normal",
        v = "visual",
        V = "v-line",
        i = "insert"
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
            return "[no name]"
        end
    end

    M.getBranchName = function()
        local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
        return branch
    end

    M.addElement = function(command, text, color)
        return command .. "\\#[bg=colour" .. color .. ", fg=black] " .. text .. " \\#[bg=colour" .. color - 3 .. ", fg=colour" .. color .. "]"
    end

    M.update = function()
        local command = ":silent !tmux set -g status-left '"
        local mode = M.getModeName()
        local branch = M.getBranchName()
        local file = M.getFileName()
        local color = 246

        if mode ~= "" then
            command = M.addElement(command, mode, color)
            color = color - 3
        end
        if branch ~= "" then
            command = M.addElement(command, branch, color)
            color = color - 3
        end
        if file ~= "" then
            command = M.addElement(command, file, color)
            color = color - 3
        end

        vim.cmd(command .. "'")
    end

    return M

end
