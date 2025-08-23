return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({
            defaults = {
                path_display={ 'truncate' }
            }, 
            pickers = {
                find_files = {
                    theme = "ivy"
                }
            }
        })

        local builtin = require('telescope.builtin')
        local opts = require('telescope.themes').get_ivy()

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})

        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})



        -- vim.keymap.set('n', '<leader>pf', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", {noremap=true});
        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({
                find_command = {
                    'rg',
                    '--files',
                    '--hidden',
                    '-g',
                    '!.git'
                }
            })
        end, {noremap=true})

        vim.keymap.set('n', '<leader>ss', function()
            builtin.grep_string();
        end)

        vim.keymap.set('n', '<leader>b', function()
            builtin.buffers({
                sort_mru=true, ignore_current_buffer=true
            })
        end)

        vim.keymap.set('n', '<leader>o', builtin.oldfiles, {})

        -- TODO: open zellij config
        vim.keymap.set("n", "<leader>en", function()
            local config_opts = require('telescope.themes').get_ivy({
                cwd = vim.fn.stdpath("config")
            })
            builtin.find_files(config_opts)
        end)

        vim.keymap.set("n", "<leader>ez", function()
            local config_opts = require('telescope.themes').get_ivy({
                cwd = {"~/.config/zellij"}
            })
            builtin.find_files(config_opts)
        end)

        vim.keymap.set("n", "<leader>tr", builtin.resume, {})

    end
}
