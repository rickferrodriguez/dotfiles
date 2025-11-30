-- Highlight, edit, and navigate code.
return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter-context',
                opts = {
                    -- Avoid the sticky context from growing a lot.
                    max_lines = 3,
                    -- Match the context lines to the source code.
                    multiline_threshold = 1,
                    -- Disable it when the window is too small.
                    min_window_height = 20,
                },
                keys = {
                    {
                        '[c',
                        function()
                            -- Jump to previous change when in diffview.
                            if vim.wo.diff then
                                return '[c'
                            else
                                vim.schedule(function()
                                    require('treesitter-context').go_to_context()
                                end)
                                return '<Ignore>'
                            end
                        end,
                        desc = 'Jump to upper context',
                        expr = true,
                    },
                },
            },
        },
        version = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'javascript',
                'typescript',
                'angular',
                'tsx',
                'scss',
                'css',
                'nginx',
                'c',
                'lua',
                'bash',
                'diff',
                'html',
                'jsdoc',
                'json',
                'jsonc',
                'latex',
                'luadoc',
                'luap',
                'markdown',
                'markdown_inline',
                'gitignore',
                'printf',
                'query',
                'regex',
                'vim',
                'vimdoc',
                'yaml',
                'xml',
            },
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<cr>',
                    node_incremental = '<cr>',
                    scope_incremental = false,
                    node_decremental = '<bs>',
                },
            },
            indent = {
                enable = true,
                -- Treesitter unindents Yaml lists for some reason.
                disable = { 'yaml' },
            },
        },
        config = function(_, opts)
            local toggle_inc_selection_group =
                vim.api.nvim_create_augroup('mariasolos/toggle_inc_selection', { clear = true })
            vim.api.nvim_create_autocmd('CmdwinEnter', {
                desc = 'Disable incremental selection when entering the cmdline window',
                group = toggle_inc_selection_group,
                command = 'TSBufDisable incremental_selection',
            })
            vim.api.nvim_create_autocmd('CmdwinLeave', {
                desc = 'Enable incremental selection when leaving the cmdline window',
                group = toggle_inc_selection_group,
                command = 'TSBufEnable incremental_selection',
            })

            require('nvim-treesitter.configs').setup(opts)
        end,
    },
}
