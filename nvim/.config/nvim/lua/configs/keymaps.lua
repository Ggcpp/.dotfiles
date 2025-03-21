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
keymap("n", "<leader>S", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", opts)
keymap("n", "<leader>s", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols = {'function', 'method' } })<cr>", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- split window
keymap("n", "<leader>/", "<C-w>v", opts)
keymap("n", "<leader>-", "<C-w>s", opts)

-- splits navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- buffers navigation
-- keymap("n", "<leader>n", "<cmd>bnext<cr>", opts)
-- keymap("n", "<leader>p", "<cmd>bprevious<cr>", opts)
keymap("n", "<C-n>", "<cmd>bnext<cr>", opts)
keymap("n", "<C-p>", "<cmd>bprevious<cr>", opts)

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

-- Dap
keymap("n", "<leader>bp", ":DapToggleBreakpoint<cr>", opts)
keymap("n", "<leader>rd", ":RustDebuggables<cr>", opts)

-- "Optimized" words movements
-- keymap("n", "w", "e<cmd>call search('[a-zA-Z]', 'Wz')<cr>", opts)
-- keymap("n", "w", "<cmd>call search('[^a-zA-Z][a-zA-Z]', 'Wze')<cr>", opts)
keymap("n", "w", "<cmd>call search('[^a-zA-Z][a-zA-Z]\\|^[a-zA-Z]', 'Wze')<cr>", opts)
keymap("n", "b", "b<cmd>call search('\\<[a-zA-Z]', 'Wbc')<cr>", opts)
keymap("n", "e", "e<cmd>call search('[a-zA-Z]\\>', 'Wzce')<cr>", opts)

-- move cursor to the middle line before 's' search
-- to ignore cursor position when pressing 's' or 'S'
-- hint: pressing 'M' move cursor to middle line.
-- keymap()

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
keymap("i", "<C-backspace>", 	"<C-w>", opts)

keymap("i", ";", 	"<end>;", opts)
keymap("i", "<C-;>", 	";", opts)
-- keymap("i", "'", 	"_", opts)
-- keymap("i", "_", 	"'", opts)
-- keymap("i", "<C-g>", 	"<C-g>u<enter>", opts)
