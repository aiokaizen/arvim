-- Key mappings to navigate between buffers in Neovim (Lua version)
vim.api.nvim_set_keymap('n', '<tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<s-tab>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bf', ':bfirst<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bl', ':blast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x', ':bdelete<CR>', { noremap = true, silent = true })

-- Remove highlight searchs
vim.api.nvim_set_keymap('n', '<Leader>nhs', ':nohlsearch<CR>', { noremap = true, silent = true })
