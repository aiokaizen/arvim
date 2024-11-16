local themes = {
    "rebelot/kanagawa.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

local telescope = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'andrew-george/telescope-themes',
        themes,
    },
    opts = {
        defaults = {
            file_ignore_patterns = { "node_modules", "venv" },
        },
    },
    config = function()
        local builtin = require('telescope.builtin')
        local telescope = require('telescope')
        local themes = require('telescope.themes')

        -- Set keymaps after telescope is loaded
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>th', "<cmd> Telescope themes <CR>", { desc = 'Telescope themes' })
        
        -- Load extensions
        telescope.load_extension('themes') 
        vim.cmd("colorscheme catppuccin-mocha")
    end
}

return telescope
