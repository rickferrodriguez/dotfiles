-- Snippets.
return {
    {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        opts = function()
            local types = require 'luasnip.util.types'
            return {
                -- Check if the current snippet was deleted.
                delete_check_events = 'TextChanged',
                -- Display a cursor-like placeholder in unvisited nodes
                -- of the snippet.
                ext_opts = {
                    [types.insertNode] = {
                        unvisited = {
                            virt_text = { { '|', 'Conceal' } },
                            virt_text_pos = 'inline',
                        },
                    },
                    [types.exitNode] = {
                        unvisited = {
                            virt_text = { { '|', 'Conceal' } },
                            virt_text_pos = 'inline',
                        },
                    },
                    [types.choiceNode] = {
                        active = {
                            virt_text = { { '(snippet) choice node', 'LspInlayHint' } },
                        },
                    },
                },
            }
        end,
        config = function(_, opts)
            local luasnip = require 'luasnip'

            ---@diagnostic disable: undefined-field
            luasnip.setup(opts)

            -- Load my custom snippets:
            require('luasnip.loaders.from_vscode').lazy_load {
                paths = vim.fn.stdpath 'config' .. '/snippets',
            }

            -- Salta al siguiente nodo
            vim.keymap.set({ 'i', 's' }, '<Tab>', function()
                return require('luasnip').jump(1)
            end, { expr = true, silent = true, desc = 'Snippet: jump to the next node' })

            -- Salta al nodo anterior
            vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
                return require('luasnip').jump(-1)
            end, { expr = true, silent = true, desc = 'Snippet: jump to the prev node' })

            -- Use <C-c> to select a choice in a snippet.
            vim.keymap.set({ 'i', 's' }, '<C-c>', function()
                if luasnip.choice_active() then
                    require 'luasnip.extras.select_choice'()
                end
            end, { desc = 'Select choice' })
            ---@diagnostic enable: undefined-field
        end,
    },
}
