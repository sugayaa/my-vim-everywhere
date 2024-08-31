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

mkdir -p $HOME/.config/nvim/lua/scripts/
mkdir -p $HOME/.config/nvim/after/plugin/

cp .config/nvim/init.lua $HOME/.config/nvim/init.lua
cp .config/nvim/lua/scripts/init.lua $HOME/.config/nvim/init.lua


git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cp .config/nvim/lua/scripts/packer.lua $HOME/.config/nvim/lua/scripts/packer.lua 


nvim --cmd "so $HOME/.config/nvim/lua/scripts/packer.lua" +PackerSync

cp .config/nvim/lua/scripts/remap.lua $HOME/.config/nvim/lua/scripts/remap.lua 
cp .config/nvim/lua/scripts/set.lua $HOME/.config/nvim/lua/scripts/set.lua 

# configs
cp .config/nvim/after/plugin/telescope.lua  $HOME/.config/nvim/after/plugin/telescope.lua 
cp .config/nvim/after/plugin/treesitter.lua $HOME/.config/nvim/after/plugin/treesitter.lua 
cp .config/nvim/after/plugin/harpoon.lua $HOME/.config/nvim/after/plugin/harpoon.lua 
cp .config/nvim/after/plugin/undotree.lua $HOME/.config/nvim/after/plugin/undotree.lua 
cp .config/nvim/after/plugin/fugitive.lua $HOME/.config/nvim/after/plugin/fugitive.lua 
cp .config/nvim/after/plugin/lsp.lua $HOME/.config/nvim/after/plugin/lsp.lua 

# pacman -Sy
# pacman -S gcc ripgrep
# if not on arch, install nvim from source
# install ripgrep
# sudo apt-get install ripgrep
