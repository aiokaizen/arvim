treesitter = {
  "nvim-treesitter/nvim-treesitter",

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "elixir",
        "heex",
        "javascript",
        "html",
        "python",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "helm",
        "json",
        "regex",
        "requirements",
        "rst",
        "scss",
        "sql",
        "ssh_config",
        "tmux",
        "toml",
        "typescript",
        "xml",
        "yaml",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}

return treesitter
