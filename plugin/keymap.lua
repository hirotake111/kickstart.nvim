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

vim.keymap.set('i', '<C-i>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = 'Accept copilot suggestion',
})

-- Use <C-j> to accept copilot suggestions in insert mode
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = 'Accept copilot suggestion',
})

-- toggle copilot chat
vim.keymap.set('n', '<leader>tt', function()
  require('CopilotChat').toggle()
  print 'Copilot chat toggled'
end, { desc = 'Toggle Copilot chat' })
