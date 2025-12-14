return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
        require('catppuccin').setup {
            background = {
                light = 'latte',
                dark = 'mocha',
            },
            float = {
                transparent = false,
                solid = false,
            },
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { 'italic' }, -- Change the style of comments
                conditionals = { 'italic' },
                loops = {},
                functions = { 'italic' },
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            transparent_background = false,
            show_end_of_buffer = false,
            integration_default = false,
            integrations = {
                barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
                cmp = true,
                gitsigns = true,
                hop = true,
                illuminate = { enabled = true },
                native_lsp = { enabled = true, inlay_hints = { background = true } },
                neogit = true,
                neotree = true,
                semantic_tokens = true,
                treesitter = true,
                treesitter_context = true,
            },
        }

        vim.api.nvim_command 'colorscheme catppuccin'
    end,
}
