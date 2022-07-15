local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap leader key
vim.g.mapleader = ' '

-- ------------
-- NORMAL MODE
-- ------------
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>o", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false, prompt_title = 'Open File' }))<cr>", opts)
keymap("n", "<leader>F", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)

-- split window
keymap("n", "<C-v>", "<C-w>v", opts)
keymap("n", "<C-h>", "<C-w>s", opts)

-- window navigation
keymap("n", "<C-p>", "<C-w>h", opts)
keymap("n", "<C-y>", "<C-w>j", opts)
keymap("n", "<C-e>", "<C-w>k", opts)
keymap("n", "<C-i>", "<C-w>l", opts)

-- ------------
-- INSERT MODE
-- ------------
keymap("i", ",", 		",<C-g>u", opts)
keymap("i", ".", 		".<C-g>u", opts)
keymap("i", ";", 		";<C-g>u", opts)
keymap("i", ":", 		":<C-g>u", opts)
keymap("i", "!", 		"!<C-g>u", opts)
keymap("i", "?", 		"?<C-g>u", opts)
keymap("i", "(", 		"(<C-g>u", opts)
keymap("i", "[", 		"[<C-g>u", opts)
keymap("i", "{", 		"{<C-g>u", opts)
keymap("i", "<tab>", 	"<tab><C-g>u", opts)
keymap("i", "<space>", 	"<C-g>u ", opts)
keymap("i", "<enter>", 	"<C-g>u<enter>", opts)
