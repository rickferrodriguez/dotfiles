-- Auto-completion:
return {
    {
        'saghen/blink.cmp',
        dependencies = 'LuaSnip',
        build = 'cargo +nightly build --release',
        version = '*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                -- Atajos personalizados para una experiencia más intuitiva
                ['<C-k>'] = { 'select_and_accept' },
                ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-a>'] = { 'snippet_forward', 'fallback' },
                ['<C-S-a>'] = { 'snippet_backward', 'fallback' },
                -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
            },
            signature = {
                enabled = false,
            },
            fuzzy = {
                implementation = 'prefer_rust_with_warning',
            },
            completion = {
                list = {
                    -- Insert items while navigating the completion list.
                    selection = { preselect = true, auto_insert = true },
                    max_items = 10,
                },
                menu = {
                    scrollbar = false,
                    border = 'rounded',
                    winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
                    scrolloff = 1,
                    draw = {
                        columns = {
                            { 'label', 'label_description', gap = 1 },
                            { 'kind_icon', 'kind' },
                            { 'source_name' },
                        },
                        treesitter = { 'lsp' },
                    },
                },
                documentation = {
                    auto_show = true,
                    treesitter_highlighting = true,
                    window = {
                        border = 'rounded',
                        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                    },
                },
                ghost_text = {
                    enabled = vim.g.ai_cmp,
                },
            },
            snippets = { preset = 'luasnip' },
            -- Disable command line completion:
            cmdline = { enabled = false, completion = { menu = { auto_show = true } } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            appearance = {
                use_nvim_cmp_as_default = false,
                kind_icons = require('icons').symbol_kinds,
            },
        },
    },
}
