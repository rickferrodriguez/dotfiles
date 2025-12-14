return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        settings = {
            save_on_toggle = true,
        },
    },
    keys = function()
        local keys = {
            {
                '<leader>l',
                function()
                    require('harpoon'):list():add()
                end,
                desc = 'Harpoon File',
            },
            {
                '<C-e>',
                function()
                    local harpoon = require 'harpoon'
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = 'Harpoon Quick Menu',
            },
            {
                '<leader>c',
                function()
                    require('harpoon'):list():select(1)
                end,
                desc = 'Harpoon File',
            },
            {
                '<leader>a',
                function()
                    require('harpoon'):list():select(2)
                end,
                desc = 'Harpoon File',
            },
            {
                '<leader>e',
                function()
                    require('harpoon'):list():select(3)
                end,
                desc = 'Harpoon File',
            },
            {
                '<leader>i',
                function()
                    require('harpoon'):list():select(4)
                end,
                desc = 'Harpoon File',
            },
        }
        return keys
    end,
}
