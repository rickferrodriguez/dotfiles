return {
    {
        'nvim-mini/mini.nvim',
        version = '*',
        enabled = true,
        config = function()
            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = true }
            local icons = require 'mini.icons'
            icons.setup()
            local indentscope = require 'mini.indentscope'
            indentscope.setup {
                draw = {
                    delay = 0,
                    animation = indentscope.gen_animation.none(),
                },
                symbol = '▏',
            }
            local surround = require 'mini.surround'
            surround.setup()
            local cursorword = require 'mini.cursorword'
            cursorword.setup()
            local bracketed = require 'mini.bracketed'
            bracketed.setup()
            local comment = require 'mini.comment'
            comment.setup()
        end,
    },
}
