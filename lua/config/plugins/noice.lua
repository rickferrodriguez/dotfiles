return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        'MunifTanjim/nui.nvim',
    },
    opts = {
        lsp = {
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                ['cmp.entry.get_documentation'] = false,
            },
        },
        routes = {
            {
                filter = {
                    event = 'msg_show',
                    any = {
                        { find = '%d+L, %d+B' },
                        { find = '; after #%d+' },
                        { find = '; before #%d+' },
                    },
                },
                view = 'mini',
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = true,
        },
    },
    config = function(_, opts)
        -- HACK: noice shows messages from before it was enabled,
        -- but this is not ideal when Lazy is installing plugins,
        -- so clear the messages in this case.
        if vim.o.filetype == 'lazy' then
            vim.cmd [[messages clear]]
        end
        require('noice').setup(opts)
    end,
}
