local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- window manage
-- hotkey for spilt screen
keymap("n", "<leader>wv", ":vsp<CR>", opts)
keymap("n", "<leader>wh", ":sp<CR>", opts)
-- close window
keymap("n", "<leader>wc", "<C-w>c", opts)
keymap("n", "<leader>wo", "<C-w>o", opts)
-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)
keymap("n", "<A-tab>", "<c-6>", opts)
-- resize windows
keymap("n", "<leader><C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<leader><C-right>", ":vertical resize +2<CR>", opts)
keymap("n", "<leader>s,", ":vertical resize -20<CR>", opts)
keymap("n", "<leader>s.", ":vertical resize +20<CR>", opts)
keymap("n", "<leader><C-up>", ":resize -2<CR>", opts)
keymap("n", "<leader><C-down>", ":resize +2<CR>", opts)
keymap("n", "<leader>sj", ":resize +10<CR>", opts)
keymap("n", "<leader>sk", ":resize -10<CR>", opts)
keymap("n", "<leader>s=", "<C-w>=", opts)

-- jump
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "J", ":m '>+1<CR>gv-gv", opts)
keymap("v", "K", ":m '<-2<CR>gv-gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)
