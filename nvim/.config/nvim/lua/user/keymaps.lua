local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap leader key
vim.g.mapleader = " "

-- NORMAL MODE --
keymap("n", "<leader>e", ":Lex 10<cr>", opts)
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)

-- INSERT MODE --
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
