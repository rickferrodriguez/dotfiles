-- Mapear 'n' para ir hacia abajo
vim.keymap.set('n', 'n', 'j', { noremap = true })
vim.keymap.set('v', 'n', 'j', { noremap = true })
vim.keymap.set('n', 'N', 'J', { noremap = true })
vim.keymap.set('v', 'N', 'J', { noremap = true })

-- Mapear 'j' para hacer n.
vim.keymap.set('n', 'j', 'n', { noremap = true })
vim.keymap.set('v', 'j', 'n', { noremap = true })
vim.keymap.set('n', 'J', 'N', { noremap = true })
vim.keymap.set('v', 'J', 'N', { noremap = true })

-- resize
vim.keymap.set('n', '<C-Up>', ':resize -2<cr>', { silent = true, desc = 'Resize window vertically' })
vim.keymap.set('n', '<C-Down>', ':resize +2<cr>', { silent = true, desc = 'Resize window vertically' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<cr>', { silent = true, desc = 'Resize window horizontally' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<cr>', { silent = true, desc = 'Resize window horizontally' })

-- Borrar en el modo 's' porque hace que el autocompletado funcione mal
vim.keymap.del('s', 'j')
vim.keymap.del('s', 'n')

vim.keymap.set('n', 'H', '^', { desc = 'Go to the end of the line' })
vim.keymap.set('n', 'L', '$', { desc = 'Go to the start of the line' })

-- Formatting.
vim.keymap.set('n', '<leader>ft', 'mzgggqG`z<cmd>delmarks z<cr>zz', { desc = 'Format buffer' })
-- Formatting.
vim.keymap.set('n', 'gQ', 'mzgggqG`z<cmd>delmarks z<cr>zz', { desc = 'Format buffer' })

-- Mark management.
vim.keymap.set('c', 'dm', 'delmarks', { desc = 'Delete marks' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to the system' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank the entire line to the system' })

vim.keymap.set('n', '<leader>v', '<C-W>v', { desc = 'Vertically split' })
vim.keymap.set('n', '<leader>$', '<C-W>s', { desc = 'Horizontal split' })

-- Quickly go to the end of the line while in insert mode.
vim.keymap.set({ 'i', 'c' }, '<C-l>', '<C-o>A', { desc = 'Go to the end of the line' })

-- Poweful <esc>.
vim.keymap.set({ 'i', 's', 'n' }, '<esc>', function()
    if require('luasnip').expand_or_jumpable() then
        require('luasnip').unlink_current()
    end
    vim.cmd 'noh'
    return '<esc>'
end, { desc = 'Escape, clear hlsearch, and stop snippet session', expr = true })

-- Escape and save changes.
vim.keymap.set({ 's', 'i', 'n', 'v' }, '<C-s>', '<esc>:w<cr>', { desc = 'Exit insert mode and save changes' })
vim.keymap.set({ 's', 'i', 'n', 'v' }, '<C-S-s>', function()
    vim.g.skip_formatting = true
    return '<esc>:w<cr>'
end, { desc = 'Exit insert mode and save changes (without formatting)', expr = true })

-- Window control
vim.keymap.set('n', '<C-n>', '<C-W>j', { desc = 'Window Navigate: Down' })
vim.keymap.set('n', '<C-k>', '<C-W>k', { desc = 'Window Navigate: Up' })
vim.keymap.set('n', '<C-l>', '<C-W>l', { desc = 'Window Navigate: Right' })
vim.keymap.set('n', '<C-h>', '<C-W>h', { desc = 'Window Navigate: Left' })

vim.keymap.set(
    'n',
    '<leader>s',
    ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
    { desc = 'Replace a work globaly in this file' }
)

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Go down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Go up and center' })

-- Open_quick_explorer
-- vim.keymap.set("n", "<leader><space>", ":Ex<CR>")

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save on this buffer' })

vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Do not lose what you have after paste' })

vim.keymap.set('', 'gm', 'gM', { desc = 'Go to the middle of the line' })

vim.keymap.set('', '<leader>h', function()
    vim.cmd 'set hlsearch!'
end, { desc = 'Toggle highlihgt search' })

vim.keymap.set('v', 'N', ":m '>+1<CR>gv=gv", { desc = 'Copy this line and move it down vertically' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Copy this line and move it up vertically' })

-- vim.keymap.set('n', '-', function()
--     vim.cmd 'Neotree source=filesystem reveal=true position=float'
-- end)

vim.keymap.set('n', '<A-e>', function()
    vim.cmd 'Neotree toggle source=filesystem reveal=true position=right'
end, { desc = 'Toggle neotree' })

-- Zen Mode
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = 'Zen Mode' })
--
----- OBSIDIAN -----
vim.keymap.set(
    'n',
    '<leader>oc',
    "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
    { desc = 'Obsidian Check Checkbox' }
)
vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTemplate<CR>', { desc = 'Insert Obsidian Template' })
vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = 'Open in Obsidian App' })
vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Show ObsidianBacklinks' })
vim.keymap.set({ 'n', 'v' }, '<leader>ol', '<cmd>Obsidian link_new<CR>', { desc = 'Show ObsidianLinks' })
vim.keymap.set('n', '<leader>on', '<cmd>Obsidian new_from_template<CR>', { desc = 'Create New Note' })
vim.keymap.set('n', '<leader>os', '<cmd>Obsidian search<CR>', { desc = 'Search Obsidian' })
vim.keymap.set('n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Quick Switch' })
