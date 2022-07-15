local list_plugins = {
    {
        "wbthomason/packer.nvim"            -- The actual package manager
    },
    {
        "gruvbox-community/gruvbox"         -- Gruvbox coloscheme
    },
    {
        "hrsh7th/nvim-cmp",
        commit="df01f9570cc32e88f1c8b24a5546fec3b6a06835"-- Completion
    },
    {
        "hrsh7th/cmp-nvim-lsp"              -- LSP completion
    },
    {
        "hrsh7th/cmp-nvim-lua"              -- Neovim Lua completion
    },
    {
        "L3MON4D3/LuaSnip"                  -- Snippets engine
    },
    {
        "neovim/nvim-lspconfig"             -- Configs for the Neovim LSP client
    },
    {
        "williamboman/nvim-lsp-installer"   -- LSP servers installer
    },
    {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim" }
        }
    },
    {
        "nvim-treesitter/nvim-treesitter"
    },
    {
        "windwp/nvim-autopairs"
    },
    {
        "kyazdani42/nvim-tree.lua"
    }
}

return list_plugins
