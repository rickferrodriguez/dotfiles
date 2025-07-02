return {
    {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        build = ':MasonUpdate',
        config = function()
            local mason = require 'mason'
            local mason_lspconfig = require 'mason-lspconfig'
            local mason_tool_installer = require 'mason-tool-installer'

            mason.setup {}

            mason_lspconfig.setup {
                -- ensure_installed = { 'angularls', 'vtsls', 'ts_ls', 'lua_ls', 'html' },
                ensure_installed = {
                    'angularls',
                    'bashls',
                    'cssls',
                    'emmet_language_server',
                    'eslint',
                    'html',
                    'jsonls',
                    'lua_ls',
                    'markdown_oxide',
                    'marksman',
                    'stylelint_lsp',
                    'tailwindcss',
                    'yamlls',
                },
                automatic_installation = true,
            }

            mason_tool_installer.setup {
                ensure_installed = {
                    'prettier',
                    'stylua',
                    'eslint_d',
                    'eslint',
                    'prettierd',
                },
            }
        end,
    },
}
