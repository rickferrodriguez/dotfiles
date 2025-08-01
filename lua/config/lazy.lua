-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
-- Hey! Put lazy into the runtimepath for neovim!
vim.opt.runtimepath:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup {
    spec = {
        -- import your plugins
        { 'nvim-tree/nvim-web-devicons', opts = {} },
        {
            'j-hui/fidget.nvim',
            config = function()
                require('fidget').setup {}
            end,
        },
        'b0o/schemastore.nvim',
        { import = 'config.plugins' },
    },
    -- Configure any other settings here. See the documentation for more details.
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false, -- get a notification when changes are found
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
}
