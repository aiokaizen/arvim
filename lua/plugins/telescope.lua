telescope = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- 'nvim-telescope/telescope-themes.nvim',  -- External theme plugin
    },
    config = function()
        local builtin = require('telescope.builtin')

        -- Set keymaps after telescope is loaded
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>th', builtin.colorscheme, { desc = 'Telescope change colorscheme' })
    end
}

return telescope
