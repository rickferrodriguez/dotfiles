return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        animate = { animate = true },
        bigfile = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = false },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        words = { enabled = true },
        indent = { enabled = false },
        input = { enabled = false },
        gh = { enabled = false },
        statuscolumn = { enabled = true },
        dashboard = {
            keys = {
                { icon = ' ', key = 'f', desc = 'Find File', action = ':Fzflua Flies' },
            },
            enabled = true,
            sections = {
                { section = 'header' },
                {
                    pane = 2,
                    section = 'terminal',
                    cmd = 'colorscript -e square',
                    height = 5,
                    padding = 1,
                },
                { section = 'keys', gap = 1, padding = 1 },
                {
                    pane = 2,
                    icon = ' ',
                    title = 'Recent Files',
                    section = 'recent_files',
                    indent = 2,
                    padding = 1,
                },
                { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
                {
                    pane = 2,
                    icon = ' ',
                    title = 'Git Status',
                    section = 'terminal',
                    enabled = function()
                        return Snacks.git.get_root() ~= nil
                    end,
                    cmd = 'git status --short --branch --renames',
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = 'startup' },
            },
        },
        picker = {
            enabled = false,
        },
    },
    keys = {
        {
            '<leader>gg',
            function()
                Snacks.lazygit()
            end,
            desc = 'Lazygit',
        },
        {
            '<leader>gl',
            function()
                Snacks.lazygit.log()
            end,
            desc = 'Lazygit Log (cwd)',
        },
    },
}
