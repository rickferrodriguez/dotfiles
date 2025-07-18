local options = {

    base46 = {
        theme = 'Gruvbox', -- default theme
        hl_add = {},
        hl_override = {},
        integrations = {},
        changed_themes = {},
        transparency = false,
        -- theme_toggle = { 'Gruvbox', 'Catppuccin' },
    },

    ui = {
        theme = { 'Gruvbox' },
        cmp = {
            icons_left = false, -- only for non-atom styles!
            style = 'default', -- default/flat_light/flat_dark/atom/atom_colored
            abbr_maxwidth = 60,
            -- for tailwind, css lsp etc
            format_colors = { lsp = true, icon = '󱓻' },
        },
        telescope = { enabled = false }, -- borderless / bordered
        statusline = {
            enabled = false,
        },
        tabufline = {
            enabled = false,
        },
    },

    nvdash = {
        enabled = false,
        load_on_startup = false,
    },

    term = {
        base46_colors = true,
        winopts = { number = false, relativenumber = false },
        sizes = { sp = 0.3, vsp = 0.2, ['bo sp'] = 0.3, ['bo vsp'] = 0.2 },
        float = {
            relative = 'editor',
            row = 0.3,
            col = 0.25,
            width = 0.5,
            height = 0.4,
            border = 'single',
        },
    },

    lsp = { signature = true },

    cheatsheet = {
        theme = 'grid', -- simple/grid
        excluded_groups = { 'terminal (t)', 'autopairs', 'Nvim', 'Opens' }, -- can add group name or with mode
    },

    mason = { pkgs = {}, skip = {} },

    colorify = {
        enabled = true,
        mode = 'virtual', -- fg, bg, virtual
        virt_text = '󱓻 ',
        highlight = { hex = true, lspvars = true },
    },
}

local status, chadrc = pcall(require, 'chadrc')
return vim.tbl_deep_extend('force', options, status and chadrc or {})
