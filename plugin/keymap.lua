vim.keymap.set('i', 'jk', '<Esc>')

-- move left/right most position of current line
vim.keymap.set('n', 'H', '_')
vim.keymap.set('n', 'L', '$')

-- test
vim.keymap.set('n', '<leader>tf', '<Plug>PlenaryTestFile', { desc = '<Plenary>Run [T]est [F]iles' })
vim.keymap.set('n', '<leader>td', ':PlenaryBustedDirectory .<CR>', { desc = '<Plenary>Run [T]est [D]irectory' })

vim.keymap.set('i', '<C-l>', function()
  local line = vim.fn.getline '.'
  local col = vim.fn.getpos('.')[3]
  local substring = line:sub(1, col - 1)
  local result = vim.fn.matchstr(substring, [[\v<(\k(<)@!)*$]])
  return '<C-w>' .. result:upper()
end, { expr = true })

-- toggle copilot suggestions
vim.keymap.set('n', '<leader>tc', function()
  require('copilot.suggestion').toggle_auto_trigger()
end, { desc = 'Toggle Copilot suggestions' })
