-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers
vim.opt.number = true
vim.opt.rnu = true

-- Window Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Line wrap
vim.opt.wrap = false

-- Tab behaviour
vim.opt.expandtab = true  -- Expands tabs into spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4  -- Control vim indents

-- Clipboard
vim.opt.clipboard = "unnamedplus"  -- Synchronizes the vim with system clipboard

-- Scroll behaviour
vim.opt.scrolloff = 999  -- Scroll stopps in the middle instead of gowing all the way down

-- Virtual Edit
vim.opt.virtualedit = "block"  -- Allow virtual editing only on visual block mode

-- Use :nohlsearch to remove highlight searches.

vim.opt.inccommand = "split"  -- Displays a split window for substitutions at the bottom.

-- Ignore case in commands
vim.opt.ignorecase = true

-- Allow 24bit color support and extand highlighting rules.
vim.opt.termguicolors = true

-- Disable netrw (Default vim treeview)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

