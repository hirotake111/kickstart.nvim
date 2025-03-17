vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', 'H', '_')
vim.keymap.set('n', 'L', '$')

-- For neovim config
vim.keymap.set('n', '<leader>tf', '<Plug>PlenaryTestFile', { desc = '<Plenary>Run [T]est [F]iles' })
vim.keymap.set('n', '<leader>td', ':PlenaryBustedDirectory .<CR>', { desc = '<Plenary>Run [T]est [D]irectory' })
vim.keymap.set('n', '<leader>x', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
vim.keymap.set('n', '<leader>X', '<cmd>source %<CR>', { desc = 'Execute the current file' })

vim.keymap.set('i', '<C-l>', function()
  local line = vim.fn.getline '.'
  local col = vim.fn.getpos('.')[3]
  local substring = line:sub(1, col - 1)
  local result = vim.fn.matchstr(substring, [[\v<(\k(<)@!)*$]])
  return '<C-w>' .. result:upper()
end, { expr = true, desc = 'Capitalize all chars in the current word' })

-- toggle copilot suggestions
vim.keymap.set('n', '<leader>tc', function()
  require('copilot.suggestion').toggle_auto_trigger()
  print 'Copilot toggled'
end, { desc = 'Toggle Copilot suggestions' })

-- toggle copilot chat
vim.keymap.set('n', '<leader>tt', function()
  require('CopilotChat').toggle()
  print 'Copilot chat toggled'
end, { desc = 'Toggle Copilot chat' })
