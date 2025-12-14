local icons = require 'icons'

-- Picker, finder, etc.
return {
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        cmd = 'FzfLua',
        keys = {
            { '<leader>f<', '<cmd>FzfLua resume<cr>', desc = 'Resume last fzf command' },
            {
                '<leader>fb',
                function()
                    local opts = {
                        winopts = {
                            height = 0.6,
                            width = 0.5,
                            preview = { vertical = 'up:70%' },
                            -- Disable Treesitter highlighting for the matches.
                            treesitter = {
                                enabled = false,
                                fzf_colors = { ['fg'] = { 'fg', 'CursorLine' }, ['bg'] = { 'bg', 'Normal' } },
                            },
                        },
                        fzf_opts = {
                            ['--layout'] = 'reverse',
                        },
                    }
                    -- Use grep when in normal mode and blines in visual mode since the former doesn't support
                    -- searching inside visual selections.
                    -- See https://github.com/ibhagwan/fzf-lua/issues/2051
                    local mode = vim.api.nvim_get_mode().mode
                    if vim.startswith(mode, 'n') then
                        require('fzf-lua').lgrep_curbuf(opts)
                    else
                        opts.query = table.concat(vim.fn.getregion(vim.fn.getpos '.', vim.fn.getpos 'v'), '\n')
                        require('fzf-lua').blines(opts)
                    end
                end,
                desc = 'Search current buffer',
                mode = { 'n', 'x' },
            },
            { '<leader>fc', '<cmd>FzfLua highlights<cr>', desc = 'Highlights' },
            { '<leader>fd', '<cmd>FzfLua lsp_document_diagnostics<cr>', desc = 'Document diagnostics' },
            { '<leader>fD', '<cmd>FzfLua lsp_workspace_diagnostics<cr>', desc = 'Workspace diagnostics' },
            { '<leader>gI', '<cmd>FzfLua lsp_implementations<cr>', desc = 'Lsp Implementations' },
            { '<leader><space>', '<cmd>FzfLua files<cr>', desc = 'Find files' },
            { '<leader>rg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep' },
            { '<leader>rg', '<cmd>FzfLua grep_visual<cr>', desc = 'Grep', mode = 'x' },
            { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help' },
            { '<leader>nc', '<cmd>FzfLua files cwd=~/.config/nvim/<cr>', desc = 'Open Config Files' },
            {
                '<leader>fk',
                function()
                    require('fzf-lua').keymaps()
                end,
                desc = '[F]ind [K]eymaps',
            },
            {
                '<leader>fr',
                function()
                    -- Read from ShaDa to include files that were already deleted from the buffer list.
                    vim.cmd 'rshada!'
                    require('fzf-lua').oldfiles()
                end,
                desc = 'Recently opened files',
            },
            { 'z=', '<cmd>FzfLua spell_suggest<cr>', desc = 'Spelling suggestions' },
        },
        opts = function()
            local actions = require 'fzf-lua.actions'

            return {
                { 'border-fused', 'hide' },
                -- Make stuff better combine with the editor.
                fzf_colors = {
                    bg = { 'bg', 'Normal' },
                    gutter = { 'bg', 'Normal' },
                    info = { 'fg', 'Conditional' },
                    scrollbar = { 'bg', 'Normal' },
                    separator = { 'fg', 'Comment' },
                },
                fzf_opts = {
                    ['--info'] = 'default',
                    ['--layout'] = 'reverse-list',
                },
                keymap = {
                    builtin = {
                        ['<C-/>'] = 'toggle-help',
                        ['<C-a>'] = 'toggle-fullscreen',
                        ['<C-i>'] = 'toggle-preview',
                        ['<C-d>'] = 'preview-page-down',
                        ['<C-u>'] = 'preview-page-up',
                    },
                    fzf = {
                        ['alt-s'] = 'toggle',
                        ['alt-a'] = 'toggle-all',
                        ['ctrl-i'] = 'toggle-preview',
                    },
                },
                winopts = {
                    height = 0.7,
                    width = 0.55,
                    preview = {
                        scrollbar = false,
                        layout = 'vertical',
                        vertical = 'up:40%',
                    },
                },
                defaults = { git_icons = false },
                -- Configuration for specific commands.
                files = {
                    formatter = 'path.filename_first',
                    winopts = {
                        preview = { hidden = true },
                    },
                },
                grep = {
                    -- Search in hidden files by default.
                    hidden = true,
                    header_prefix = icons.misc.search .. ' ',
                    rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g "!.git" -e',
                    rg_glob_fn = function(query, opts)
                        local regex, flags = query:match(string.format('^(.*)%s(.*)$', opts.glob_separator))
                        -- Return the original query if there's no separator.
                        return (regex or query), flags
                    end,
                },
                helptags = {
                    actions = {
                        -- Open help pages in a vertical split.
                        ['enter'] = actions.help_vert,
                    },
                },
                lsp = {
                    symbols = {
                        symbol_icons = icons.symbol_kinds,
                    },
                    code_actions = {
                        winopts = {
                            width = 70,
                            height = 20,
                            relative = 'cursor',
                            preview = {
                                hidden = true,
                                vertical = 'down:50%',
                            },
                        },
                    },
                },
                oldfiles = {
                    formatter = 'path.filename_first',
                    include_current_session = true,
                    winopts = {
                        preview = { hidden = true },
                    },
                },
            }
        end,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(items, opts, on_choice)
                local ui_select = require 'fzf-lua.providers.ui_select'

                -- Register the fzf-lua picker the first time we call select.
                if not ui_select.is_registered() then
                    ui_select.register(function(ui_opts)
                        if ui_opts.kind == 'luasnip' then
                            ui_opts.prompt = 'Snippet choice: '
                            ui_opts.winopts = {
                                relative = 'cursor',
                                height = 0.35,
                                width = 0.3,
                            }
                        elseif ui_opts.kind == 'lsp_message' then
                            ui_opts.winopts = { height = 0.4, width = 0.4 }
                        else
                            ui_opts.winopts = { height = 0.6, width = 0.5 }
                        end

                        return ui_opts
                    end)
                end

                -- Don't show the picker if there's nothing to pick.
                if #items > 0 then
                    return vim.ui.select(items, opts, on_choice)
                end
            end
        end,
    },
}
