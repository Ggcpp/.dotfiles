local list_plugins = {
    {
        "wbthomason/packer.nvim" -- The actual package manager
    },
    {
        "gruvbox-community/gruvbox" -- Gruvbox coloscheme
    },
    {
        "ful1e5/onedark.nvim" -- coloscheme deprecated
        -- "monsonjeremy/onedark.nvim",
        -- branch = "treesitter"
    },
    {
        "hrsh7th/nvim-cmp",
        commit = "df01f9570cc32e88f1c8b24a5546fec3b6a06835" -- Completion
    },
    {
        "hrsh7th/cmp-nvim-lsp" -- LSP completion
    },
    {
        "hrsh7th/cmp-nvim-lua" -- Neovim Lua completion
    },
    {
        "L3MON4D3/LuaSnip" -- Snippets engine
    },
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "neovim/nvim-lspconfig" -- Configs for the Neovim LSP client
    },
    --    {
    --        "williamboman/nvim-lsp-installer"   -- LSP servers installer
    --    },
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
    },
    {
        --"vimpostor/vim-tpipeline"           -- Merge Neovim and Tmux status line
        --"narajaon/onestatus"
    },
    {
        "akinsho/toggleterm.nvim"
    },
    {
        "tikhomirov/vim-glsl"
    },
    {
        "ray-x/lsp_signature.nvim"
    },
    {
        "iamcco/markdown-preview.nvim",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" }
    },
    {
        "ThePrimeagen/vim-be-good"
    },
    {
        "ggandor/lightspeed.nvim"
    },
    {
        "mfussenegger/nvim-dap"
    },
    {
        "rcarriga/nvim-dap-ui",
        requires = {
            { "mfussenegger/nvim-dap" },
            { "nvim-neotest/nvim-nio" }
        }
    },
    {
        "simrat39/rust-tools.nvim"
    },
    {
        "nvim-tree/nvim-web-devicons"
    },
    {
        "akinsho/flutter-tools.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "stevearc/dressing.nvim" },
        },
    },
}

return list_plugins
