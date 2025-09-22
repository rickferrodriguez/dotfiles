return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        completions = {
            lsp = { enabled = true },
            blink = { enabled = true },
        },
        latex = { enabled = false },
        heading = {
            enabled = true,
            sign = true,
            icons = { '① ', '② ', '③ ', '④ ', '⑤ ', '⑥ ' },
            left_pad = 1,
        },
        bullet = {
            enabled = true,
            icons = { '●', '○', '◆', '◇' },
            right_pad = 1,
            highlight = 'render-markdownBullet',
        },
    },
}
