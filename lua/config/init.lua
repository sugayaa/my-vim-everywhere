require("config.set")
require("config.remap")
require("config.lazy-init")

-- autocmd('LspAttach', {
--     callback = function(e)
--         local opts = { buffer = e.buf }
--         vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--         vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--         vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--         vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--         vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--         vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--         vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--         vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--         vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--         vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--     end
-- })

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
