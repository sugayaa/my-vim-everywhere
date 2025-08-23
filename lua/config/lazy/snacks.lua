return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = {
            enabled = true,
            autoclose = true
        },
        indent = { enabled = true },
        input = { enabled = true },
        picker = {
            enabled = true,
            -- sources = {
            --     win = {
            --         list = {
            --             keys = {
            --                 "\\", desc = "File Explorer", function()
            --                     local explorer_pickers = Snacks.picker.get({ source = "explorer" })
            --                     if #explorer_pickers == 0 then
            --                         Snacks.picker.explorer()
            --                         -- elseif explorer_pickers[1]:is_focused() then
            --                         -- 	explorer_pickers[1]:close()
            --                     else
            --                         explorer_pickers[1]:focus()
            --                     end
            --                 end
            --             },
            --         },
            --     },
            -- },
        },
        notifier = { enabled = true },
        quickfile = { enabled = false },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}
