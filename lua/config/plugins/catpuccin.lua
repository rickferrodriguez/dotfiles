return {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    name = 'catppuccin',
    config = function()
        require('catppuccin').setup {
            flavour = 'macchiato', -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = 'latte',
                dark = 'macchiato',
            },
            transparent_background = false, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = 'dark',
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { 'italic' }, -- Change the style of comments
                conditionals = { 'italic' },
                loops = {},
                functions = { 'bold' },
                keywords = { 'italic' },
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            color_overrides = {
                -- mocha = {
                -- 	base = "#181825",
                -- },
                -- macchiato = {
                --     base = '#1e242b',
                -- },
                -- latte = {
                --     base = '#fbf0e9',
                -- },
            },
            default_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = '',
                },
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { 'undercurl' },
                        hints = { 'undercurl' },
                        warnings = { 'undercurl' },
                        information = { 'undercurl' },
                    },
                },
                navic = { enabled = true, custom_bg = 'lualine' },
                snacks = true,
                treesitter_context = true,
                blink_cmp = true,
                dropbar = {
                    enabled = true,
                    color_mode = true,
                },
                flash = true,
                fzf = true,
                harpoon = true,
                indent_blankline = true,
                markdown = true,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        }

        -- setup must be called before loading
        -- vim.cmd.colorscheme 'catppuccin'
    end,
}
