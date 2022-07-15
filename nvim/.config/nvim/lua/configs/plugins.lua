local function printBeforeInit()
	-- ---------------------------------------------
	-- Message before first installation of plugins
	-- ---------------------------------------------
    vim.opt.termguicolors = true
    vim.cmd("colorscheme industry")

    vim.notify([[

	|\   \\\\__     o ==================================
	| \_/    o \    o   Plugins will start installing,  
	> _   (( <_  oo            wait for the end         
	| / \__+___/             then restart Neovim.       
	|/     |/         ==================================
	    ]])
end

local M = {}

M.setup = function(config)
	local fn = vim.fn

	-- --------------------------------------------------------------
	-- Install packer.nvim (plugin manager) if not already installed
	-- --------------------------------------------------------------
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	local is_bootstrap = false  -- is it the bootstrap time of packer?

	if fn.empty(fn.glob(install_path)) > 0 then     -- if packer.nvim doesn't exist
	    is_bootstrap = fn.system {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path
	    }

	    vim.cmd([[packadd packer.nvim]])    -- everything between [[...]] is converted to a literal string
	end

	-- Get the packer module
	local packer = require("packer")

	-- ---------------------------------------------------
	-- Configure packer to be displayed as a popup window
	-- ---------------------------------------------------
	packer.init {
	    display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end
	    }
	}

	-- -------------------------
	-- Plugins use/installation
	-- -------------------------
	packer.startup(function(use)
        local plugins = require "list_plugins"

        -- disable commit field if on 'main' config
        if config == "main" then
            for _, plugin in pairs(plugins) do
                if plugin.commit then
                    plugin.commit = nil
                end
            end
        end

        -- use plugins
        for _, plugin in pairs(plugins) do
            use(plugin)
        end

	    -- Install and compile if we are bootstrapping packer
	    if is_bootstrap then
            printBeforeInit()
            require("packer").sync()
	    end
	end)

	return not is_bootstrap
end

return M
