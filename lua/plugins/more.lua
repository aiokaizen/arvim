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
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
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
            vim.keymap.set('n', '<C-n>', api.tree.toggle, { desc = 'nvim-tree: Toggle' })
            vim.keymap.set('n', '?', api.tree.toggle_help, { desc = 'nvim-tree: Help' })
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
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
        config = function()
            require('nvim-autopairs').setup({
                check_ts = true,                          -- Enable treesitter integration if installed
                disable_filetype = { "TelescopePrompt" }, -- Disable in certain file types
            })
        end
    },
    {
        "elentok/format-on-save.nvim",
        dependancies = {
            "rcarriga/nvim-notify"
        },
        config = function()
            local format_on_save = require("format-on-save")
            local vim_notify = require("format-on-save.error-notifiers.vim-notify")
            local formatters = require("format-on-save.formatters")

            format_on_save.setup({
                exclude_path_patterns = {
                    "/node_modules/",
                    "/venv/",
                },

                formatter_by_ft = {
                    python = formatters.ruff,
                    css = formatters.lsp,
                    html = formatters.lsp,
                    javascript = formatters.lsp,
                    json = formatters.lsp,
                    lua = formatters.lsp,
                    markdown = formatters.prettierd,
                    openscad = formatters.lsp,
                    rust = formatters.lsp,
                    scad = formatters.lsp,
                    scss = formatters.lsp,
                    sh = formatters.shfmt,
                    typescript = formatters.prettierd,
                    typescriptreact = formatters.prettierd,
                    yaml = formatters.lsp,

                    -- Add your own shell formatters:
                    -- myfiletype = formatters.shell({ cmd = { "myformatter", "%" } }),

                    -- Concatenate formatters
                    -- python = {
                    --     formatters.remove_trailing_whitespace,
                    --     formatters.shell({ cmd = "tidy-imports" }),
                    --     formatters.black,
                    --     formatters.ruff,
                    -- },
                },
                error_notifier = vim_notify,
            })
        end
    },
    {
        'anuvyklack/pretty-fold.nvim',
        event = "BufWinEnter", -- Load on entering a buffer
        config = function()
            require('pretty-fold').setup()
        end
    },
    {
        "karb94/neoscroll.nvim",
        event = "BufWinEnter", -- Load on entering a buffer
        config = function()
            require("neoscroll").setup({
                hide_cursor = false
            })
        end
    },
    -- {
    --   "nvimtools/none-ls.nvim",
    --   ft = { "python" },
    --   opts = function()
    --     return require "custom.configs.null-ls"
    --   end,
    -- },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    }
}
