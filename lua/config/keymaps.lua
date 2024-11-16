-- Key mappings to navigate between buffers in Neovim (Lua version)
vim.api.nvim_set_keymap("n", "<Leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bp", ":bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bf", ":bfirst<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bl", ":blast<CR>", { noremap = true, silent = true })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })

map("n", "<leader>ff", "<cmd> Telescope find_files", { desc = "Telescope find files" })
map("n", "<leader>fg", "<cmd> Telescope live_grep", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd> Telescope buffers", { desc = "Telescope buffers" })
map("n", "<leader>fh", "<cmd> Telescope help_tags", { desc = "Telescope help tags" })
map("n", "<leader>th", "<cmd> Telescope themes <CR>", { desc = "Telescope themes" })
