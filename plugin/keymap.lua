vim.keymap.set('i', 'jk', '<Esc>')

-- move left/right most position of current line
vim.keymap.set('n', 'H', '_')
vim.keymap.set('n', 'L', '$')

-- test
vim.keymap.set('n', '<leader>tf', '<Plug>PlenaryTestFile', { desc = '<Plenary>Run [T]est [F]iles' })
vim.keymap.set('n', '<leader>td', ':PlenaryBustedDirectory .<CR>', { desc = '<Plenary>Run [T]est [D]irectory' })
