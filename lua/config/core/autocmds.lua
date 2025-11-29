vim.api.nvim_create_autocmd('BufReadPost', {
    group = vim.api.nvim_create_augroup('mariasolos/last_location', { clear = true }),
    desc = 'Go to the last location when opening a buffer',
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd 'normal! g`"zz'
        end
    end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('no_auto_comment', {}),
    callback = function()
        vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
    end,
})
