return {
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        ---@type Flash.Config
        opts = {
            jump = { nohlsearch = true },
            labels = 'tcranisedpkglomuh',
            search = {
                exclude = {
                    'flash_prompt',
                    'noice',
                    'notify',
                    'qf',
                    function(win)
                        -- Floating windows from bqf.
                        if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match 'BqfPreview' then
                            return true
                        end

                        -- Non-focusable windows.
                        return not vim.api.nvim_win_get_config(win).focusable
                    end,
                },
            },
            modes = {
                search = { enabled = true },
            },
        },
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, false },
            { "<leader>t",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        },
    },
}
