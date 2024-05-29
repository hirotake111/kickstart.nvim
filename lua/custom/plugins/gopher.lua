return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  config = function(_, opts)
    require('gopher').setup(opts)
    vim.keymap.set('n', '<leader>gjs', '<cmd>GoTagAdd json<CR>', { desc = '[G]oTagAdd [J]son [S]truct' })
  end,
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
}
