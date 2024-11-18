return {
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
          "TmuxNavigateLeft",
          "TmuxNavigateDown",
          "TmuxNavigateUp",
          "TmuxNavigateRight",
          "TmuxNavigatePrevious",
        },
        keys = {
          { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
          { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
          { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
          { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
          { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()

            require("nvim-tree").setup()

            local api = require("nvim-tree.api")
            -- custom mappings
            vim.keymap.set('n', '<C-n>', api.tree.toggle,                { desc = 'nvim-tree: Toggle'})
            vim.keymap.set('n', '?',     api.tree.toggle_help,           { desc = 'nvim-tree: Help'})
        end,
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    indicator = {
                        icon = '',
                        style = 'icon',
                    },
                    tab_size = 20,
                    max_name_length = 20,
                }
            })
        end
    }
}
