#!/bin/bash
set -e

if [ $HOME == "" ]; then
    echo "\$HOME not set in environment"
fi


if [ -d $HOME/.config/nvim ]; then
    echo "Directory .config/nvim exists, do you wanna backup first?"
    exit
fi

if [ -d $HOME/.local/share/nvim/site/pack/ ]; then
    echo "Directory .local/share/nvim/site/pack/ exists, do you wanna backup first?"
    exit
fi

mkdir -p $HOME/.config/nvim/lua/config/lazy

cp config/nvim/init.lua $HOME/.config/nvim/init.lua
cp config/nvim/lua/config/init.lua $HOME/.config/nvim/lua/config/init.lua
cp config/nvim/lua/config/lazy/init.lua $HOME/.config/nvim/lua/config/lazy/init.lua


cp config/nvim/lua/config/lazy-init.lua $HOME/.config/nvim/lua/config/lazy-init.lua 
cp config/nvim/lua/config/remap.lua $HOME/.config/nvim/lua/config/remap.lua 
cp config/nvim/lua/config/set.lua $HOME/.config/nvim/lua/config/set.lua 

# configs
cp config/nvim/lua/config/lazy/telescope.lua  $HOME/.config/nvim/lua/config/lazy/telescope.lua 
cp config/nvim/lua/config/lazy/treesitter.lua $HOME/.config/nvim/lua/config/lazy/treesitter.lua 
cp config/nvim/lua/config/lazy/fugitive.lua $HOME/.config/nvim/lua/config/lazy/fugitive.lua 
cp config/nvim/lua/config/lazy/lualine.lua $HOME/.config/nvim/lua/config/lazy/lualine.lua 
cp config/nvim/lua/config/lazy/lsp.lua $HOME/.config/nvim/lua/config/lazy/lsp.lua 
cp config/nvim/lua/config/lazy/lexima.lua $HOME/.config/nvim/lua/config/lazy/lexima.lua 
cp config/nvim/lua/config/lazy/gitsigns.lua $HOME/.config/nvim/lua/config/lazy/gitsigns.lua 
cp config/nvim/lua/config/lazy/which-key.lua $HOME/.config/nvim/lua/config/lazy/which-key.lua 
cp config/nvim/lua/config/lazy/colorscheme.lua $HOME/.config/nvim/lua/config/lazy/colorscheme.lua 
cp config/nvim/lua/config/lazy/harpoon.lua $HOME/.config/nvim/lua/config/lazy/harpoon.lua 

# pacman -Sy
# pacman -S gcc ripgrep
# if not on arch, install nvim from source
# install ripgrep
# sudo apt-get install ripgrep
