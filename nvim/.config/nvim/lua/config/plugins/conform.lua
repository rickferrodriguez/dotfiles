return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        notify_no_formatters = false,
        formatters_by_ft = {
            javascript = { 'prettierd', 'prettier', stop_after_first = true },
            typescript = { 'prettierd', 'prettier', stop_after_first = true },
            javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
            typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
            svelte = { 'prettierd', 'prettier', stop_after_first = true },
            css = { 'prettierd', 'prettier', stop_after_first = true },
            html = { 'prettierd', 'prettier', stop_after_first = true },
            json = { 'prettierd', stop_on_first = true, name = 'dprint', timeout_ms = 500 },
            yaml = { 'prettierd', 'prettier', stop_after_first = true },
            markdown = { 'prettierd', 'prettier', stop_after_first = true },
            graphql = { 'prettierd', 'prettier', stop_after_first = true },
            liquid = { 'prettierd', 'prettier', stop_after_first = true },
            lua = { 'stylua' },
            ['_'] = { 'trim_whitespace', 'trim_newlines' },
        },
        format_on_save = function()
            -- Don't format when minifiles is open, since that triggers the "confirm without
            -- synchronization" message.
            if vim.g.minifiles_active then
                return nil
            end

            -- Stop if we disabled auto-formatting.
            if not vim.g.autoformat then
                return nil
            end

            return {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            }
        end,
        formatters = {
            -- Require a Prettier configuration file to format.
            prettier = { require_cwd = true },
            prettierd = { require_cwd = true },
        },
    },
    init = function()
        -- Use conform for gq.
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

        -- Start auto-formatting by default (and disable with my ToggleFormat command).
        vim.g.autoformat = true
    end,
}
