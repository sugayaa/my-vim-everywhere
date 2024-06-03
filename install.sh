mkdir -p /home/sugaya/.config/nvim/lua/scripts/
touch /home/sugaya/.config/nvim/init.lua
touch /home/sugaya/.config/nvim/lua/scripts/init.lua
echo 'require("scripts")' >> /home/sugaya/.config/nvim/init.lua
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo > /home/sugaya/.config/nvim/lua/scripts/packer.lua << EOF
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({
	'rose-pine/neovim',
	as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine-moon')
	end
	})
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    -- {'williamboman/mason.nvim'},
    -- {'williamboman/mason-lspconfig.nvim'},

    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}

end)
EOF
vim +PackerSync

mkdir -p /home/sugaya/.config/nvim/after/plugin/
echo > /home/sugaya/.config/nvim/after/plugin/telescope.lua << EOF
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
EOF

cat > /home/sugaya/.config/nvim/after/plugin/treesitter.lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "python", "go", "bash", "java" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF


echo > /home/sugaya/.config/nvim/after/plugin/harpoon.lua << EOF
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
EOF

echo > /home/sugaya/.config/nvim/after/plugin/undotree.lua << EOF
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
EOF

echo > /home/sugaya/.config/nvim/after/plugin/fugitive.lua << EOF
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
EOF

# TODO: stopped at lsp-zero
sudo pacman -S ripgrep
