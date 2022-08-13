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
keymap("n", "<leader>/", "<C-w>v", opts)
keymap("n", "<leader>-", "<C-w>s", opts)

-- splits navigation
keymap("n", "<C-p>", "<C-w>h", opts)
keymap("n", "<C-y>", "<C-w>j", opts)
keymap("n", "<C-e>", "<C-w>k", opts)
keymap("n", "<C-i>", "<C-w>l", opts)

-- buffers navigation
keymap("n", "<leader>n", "<cmd>bnext<cr>", opts)
keymap("n", "<leader>p", "<cmd>bprevious<cr>", opts)

-- LSP Go To
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
keymap("n", "gs", "<cmd>ClangdSwitchSourceHeader<cr>", opts)

-- LSP Actions
keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
keymap("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>=", "<cmd>lua vim.lsp.buf.format()<cr>", opts)


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
