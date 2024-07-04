local rt = require("rust-tools")

local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local codelldb_path = codelldb:get_install_path() .. "/extension/adapter/codelldb"
local liblldb_path = codelldb:get_install_path() .. "/extension/lldb/lib/liblldb.so"

rt.setup({
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    tools = {
        inlay_hints = {
            auto = false,
        }
    }
})
