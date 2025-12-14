vim.o.breakindent = true -- Indent wrapped lines to match line start
vim.o.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.o.wrap = false
vim.o.textwidth = 90
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.colorcolumn = '90'

-- Enable spelling and wrap for window
vim.cmd 'setlocal spell'

-- Set markdown-specific surrounding in 'mini.surround'
vim.b.minisurround_config = {
    custom_surroundings = {
        -- Markdown link. Common usage:
        -- `saiwL` + [type/paste link] + <CR> - add link
        -- `sdL` - delete link
        -- `srLL` + [type/paste link] + <CR> - replace link
        L = {
            input = { '%[().-()%]%(.-%)' },
            output = function()
                local link = require('mini.surround').user_input 'Link: '
                return { left = '[', right = '](' .. link .. ')' }
            end,
        },
    },
}
