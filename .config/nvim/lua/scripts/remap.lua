vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")
-- tmux users
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})


vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>", {silent = true})
vim.keymap.set("n", "<leader>q", "<cmd>:q<CR>")
vim.keymap.set("n", "<leader>so", "<cmd>:so<CR>")
vim.keymap.set("n", "<leader>PS", "<cmd>:PackerSync<CR>")
vim.keymap.set("n", "H", "^", {silent = true})
vim.keymap.set("n", "L", "$", {silent = true})

vim.keymap.set({"n", "x", "o"}, "<M-h>", "<cmd>bp<cr>")
vim.keymap.set({"n", "x", "o"}, "<M-l>", "<cmd>bn<cr>")

vim.keymap.set("n", "<leader>nc", "<cmd>Telescope neoclip<cr>")

vim.keymap.set('n', '<leader>dv', '<cmd>DiffviewOpen<cr>')
vim.keymap.set('n', '<leader>dbh', '<cmd>DiffviewFileHistory<cr>')
vim.keymap.set('n', '<leader>dh', '<cmd>DiffviewFileHistory %<cr>')
vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<cr>')

vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>", {})
vim.keymap.set("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame<CR>", {})

