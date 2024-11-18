return {
    {
        -- TODO: Configure
        "mfussenegger/nvim-dap",
    },
    {
        -- TODO: Configure
        "mfussenegger/nvim-dap-python",
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python",
            { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
        lazy = false,
        branch = "regexp", -- This is the regexp branch, use this for the new version
        config = function()
            require("venv-selector").setup({
                debug = true,
            })
        end,
        keys = {
            { ",v", "<cmd>VenvSelect<cr>" },
        },
    },
}
