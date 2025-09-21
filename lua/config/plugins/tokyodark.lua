return {
    'tiagovla/tokyodark.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        transparent_background = false,
        gamma = 1.0,
        styles = {
            comments = { italic = true },
            keywords = {},
            identifiers = {},
            functions = {},
            variables = {},
        },
        terminal_colors = true, -- Habilitar colores en la terminal
        custom_highlights = function(highlights, palette)
            return {
                Visual = { bg = '#2F344F', blend = 90 },
            }
        end, -- Personalizar resaltados adicionales (opcional)
        custom_palette = {}, -- Personalizar paleta de colores (opcional)
    },
    config = function(_, opts)
        -- require('tokyodark').setup(opts) -- calling setup is optional
        -- vim.cmd [[colorscheme tokyodark]]
    end,
}
