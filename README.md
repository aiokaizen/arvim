# ARVIM

## Description

This is an nvim configuration created from scratch and that is optimized for python development.

## Requirements

1. Install xclip (Necessary for system clipboard sync)
2. Install ripgrep (rg) to enable fuzzy finding within telescope.
3. Install lazygit (Optional) for better git support in nvim. for complete installation instructions
or for other os systems, checkout the (documentation)[https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation]
4. Install `fd` for better support with telescope.

### Code
``` bash
sudo apt install xclip
sudo apt install ripgrep

# Install lazygit for Debian / Ubuntu
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# Installing fd for telescope
apt install fd-find
```


## Installation

1. Backup your current nvim installation:
``` bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

2. Clone the repository
``` bash
git clone https://github.com/aiokaizen/arvim.git ~/.config/nvim
```

3. Start neovim using the `nvim` command. This will install `lazy.nvim` and all its dependancies.


## Options


## Keymaps

