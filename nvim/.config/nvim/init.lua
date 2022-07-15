-- After changing the config mode and save the file,
-- you need to type ':PackerSync' command in Neovim to apply change.

local config = "main" -- main/stable

if not require("configs.plugins").setup(config) then return end

require "configs.options"
require "configs.keymaps"
require "configs.colorscheme"
require "configs.telescope"
require "configs.treesitter"
require "configs.autopairs"
require "configs.tree"
require "configs.cmp"
require "configs.lsp" -- lsp/init.lua by default
