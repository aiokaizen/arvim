local themes = {
  "rebelot/kanagawa.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

local telescope = {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "andrew-george/telescope-themes",
    themes,
  },
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", "venv" },
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
  config = function()
    local telescope = require("telescope")

    -- Load extensions
    telescope.load_extension("themes")

    -- Apply default theme
    vim.cmd("colorscheme catppuccin-mocha")
  end,
}

return telescope
