return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    local list = harpoon:list()
    local navigate = function(i)
      return function()
        list:select(i)
      end
    end

    harpoon.setup()

    vim.keymap.set('n', '<leader>a', function()
      list:add()
    end, { desc = '<Harpoon>add file' })

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(list)
    end, { desc = '<Harpoon>List files' })

    vim.keymap.set('n', '<C-t>', navigate(1), { desc = '<Harpoon>navigates to file 1' })
    vim.keymap.set('n', '<C-u>', navigate(2), { desc = '<Harpoon>navigates to file 2' })
    vim.keymap.set('n', '<C-n>', navigate(3), { desc = '<Harpoon>navigates to file 3' })
    vim.keymap.set('n', '<C-m>', navigate(4), { desc = '<Harpoon>navigates to file 4' })

    vim.keymap.set('n', '<Tab>', function()
      list:next()
    end, { desc = '<Harpoon>navigates to next file' })

    vim.keymap.set('n', '<S-Tab>', function()
      list:prev()
    end, { desc = '<Harpoon>navigates to previous file' })
  end,
}
