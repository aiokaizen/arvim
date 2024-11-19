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
    config = function()
        local builtin = require('telescope.builtin')
        local telescope = require('telescope')

        -- Set keymaps after telescope is loaded
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files({ hidden = false, no_ignore = true, no_ignore_parent = true })
        end, { desc = 'Telescope find files (Include .gitignored files)' })
        vim.keymap.set('n', '<leader>fg', function()
            builtin.live_grep({ hidden = false, no_ignore = true, no_ignore_parent = true })
        end, { desc = 'Telescope live grep (Include .gitignored files)' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>th', "<cmd> Telescope themes <CR>", { desc = 'Telescope themes' })

        telescope.setup({
            defaults = {
                file_ignore_patterns = { "node_modules", "venv", "__pycache__" },
            },
        })

        -- Load extensions
        telescope.load_extension('themes')
        vim.cmd("colorscheme catppuccin-mocha")
    end
}

return telescope
