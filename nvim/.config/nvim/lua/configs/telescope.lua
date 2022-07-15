local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-y>"] = actions.move_selection_next,
                ["<C-e>"] = actions.move_selection_previous,
                ["<C-i>"] = actions.select_default
            }
        },
    }
})
