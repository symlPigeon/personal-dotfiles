-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- local variable
local map = vim.api.nvim_set_keymap
-- reuse opt
local opt = {
    noremap = true,
    silent = true
}
-- plugin hotkeys
local pluginKeys = {}

-- -- window manage
-- hotkey for spilt screen
map("n", "<leader>sv", ":vsp<CR>", opt)
map("n", "<leader>sh", ":sp<CR>", opt)
-- close current window
map("n", "<leader>sc", "<C-w>c", opt)
-- close other window
map("n", "<leader>so", "<C-w>o", opt)
-- alt + hjkl to move between windows
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
map("n", "<A-Left>", "<C-w>h", opt)
map("n", "<A-Down>", "<C-w>j", opt)
map("n", "<A-Up>", "<C-w>k", opt)
map("n", "<A-Right>", "<C-w>l", opt)
-- resize windows
-- vertically
map("n", "<leader><C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<leader><C-right>", ":vertical resize +2<CR>", opt)
map("n", "<leader>s,", ":vertical resize -20<CR>", opt)
map("n", "<leader>s.", ":vertical resize +20<CR>", opt)
-- hortizontally
map("n", "<leader><C-up>", ":resize -2<CR>", opt)
map("n", "<leader><C-down>", ":resize +2<CR>", opt)
map("n", "<leader>sj", ":resize +10<CR>", opt)
map("n", "<leader>sk", ":resize -10<CR>", opt)
-- same ratio
map("n", "<leader>s=", "<C-w>=", opt)

-- -- Terminal
map("n", "<leader>t", ":sp | terminal fish<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal fish<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<A-Left>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-Down>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-Up>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-Right>", [[ <C-\><C-N><C-w>l ]], opt)

-- code indent
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- move selected lines up and down
map("v", "J", ":m '>+1<CR>gv-gv", opt)
map("v", "K", ":m '<-2<CR>gv-gv", opt)

-- view code
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- map("n", "<C-Up>", "9k", opt)
-- map("n", "<C-Down>", "9j", opt)

-- Insert mode
map("i", "<C-h>", "<Esc>I", opt)
map("i", "<C-j>", "<Esc>A", opt)


return pluginKeys
