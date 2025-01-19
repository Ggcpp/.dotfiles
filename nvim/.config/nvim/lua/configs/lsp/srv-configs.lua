require("mason").setup()
require("mason-lspconfig").setup()

local lsp_installer = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local servers = {
    "clangd",
    "rust_analyzer",
    "html",
    "jsonls",
    "lua_ls",
}

lsp_installer.setup({
    ensure_installed = servers,
    handlers = {
        -- it loops through all installed servers (including none ensured installed)
        function(server)
            local opts = {
                -- get client capabilities
                capabilities = require("configs.lsp.handlers").getCapabilities()
            }

            -- add custom server settings if exist
            local has_custom_settings, custom_settings = pcall(require, "configs.lsp.settings." .. server)
            if has_custom_settings then
                opts = vim.tbl_deep_extend("force", opts, custom_settings)
            end

            -- setup server config
            lspconfig[server].setup(opts)
        end
    }
})
