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
keymap("n", "<leader>v", "<C-w>v", opts)
keymap("n", "<leader>h", "<C-w>s", opts)

-- splits navigation
keymap("n", "<C-p>", "<C-w>h", opts)
keymap("n", "<C-y>", "<C-w>j", opts)
keymap("n", "<C-e>", "<C-w>k", opts)
keymap("n", "<C-i>", "<C-w>l", opts)

-- buffers navigation
keymap("n", "<leader>n", "<cmd>bnext<cr>", opts)
keymap("n", "<leader>p", "<cmd>bprevious<cr>", opts)

-- lsp diagnostics
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

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
