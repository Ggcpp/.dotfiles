local M = {}

-- Configure how Neovim displays signs (native to nvim)
M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" }
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = ""})
    end

    local config = {
        virtual_text = false,
        signs = {
            active = signs
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = ""
        }
    }

    -- configure how errors and warnings proceed (provide by nvim itself)
    vim.diagnostic.config(config)
end

-- -------------------------------------------------------------------------------------------------------------
-- Set capabilities (nvim-cmp-lsp supports LSP capabilities): it will advertise capabilities to the LSP server
-- 
-- Capabilities:    They are flags which are exchanged between the client and the server during initialization,
--                  so the client (nvim-cmp-lsp) can signal to the server what he can handle.
-- -------------------------------------------------------------------------------------------------------------
M.getCapabilities = function()
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    
    return cmp_nvim_lsp.update_capabilities(capabilities)
end

return M
