-- unbind autopairs disable key
vim.g.AutoPairsShortcutToggle = ''

-- shift + arrow selection
keys = {'Up','Down','Left','Right'}
for keyIndex = 1, 4 do
    key = keys[keyIndex]
    vim.api.nvim_set_keymap(
        'n', '<S-' .. key .. '>', 'v<' .. key .. '>', {}
    )
    vim.api.nvim_set_keymap(
        'v', '<S-' .. key .. '>', '<' .. key .. '>', {}
    )
    vim.api.nvim_set_keymap(
        'i', '<S-' .. key .. '>', '<Esc>' .. 'v<' .. key .. '>', {}
    )
end

-- tab switch
vim.api.nvim_set_keymap('n', '<leader>h', ":tabp<CR>", {})
vim.api.nvim_set_keymap('l', '<leader>l', ":tabn<CR>", {})

-- save and exit on ctrl + s and ctrl + q
vim.api.nvim_set_keymap('n', '<C-s>', ":w<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Q>', ":wq<CR>", { noremap = true, silent = true})

-- show errors
vim.api.nvim_set_keymap('', '<C-e>', ':lua vim.diagnostic.setqflist()<CR>', {})

-- disable search highlight
vim.api.nvim_set_keymap('n', ',<space>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- smart splits binds
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)

vim.keymap.set('', '<leader>rn', require('renamer').rename)

-- pin close and pin
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true})

for keyIndex = 0, 9 do
    vim.keymap.set(
        'n', '<A-1>', '<Cmd>BufferGoto ' .. tostring(keyIndex) .. '<CR>',
        { noremap = true, silent = true }
    )
end
