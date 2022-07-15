local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

local servers = {
    "clangd",
    "sumneko_lua"
}

lsp_installer.setup({
    ensure_installed = servers
})

for _, server in pairs(servers) do
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
