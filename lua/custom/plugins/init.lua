-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'
      local formatting = null_ls.builtins.formatting
      -- local completion = null_ls.builtins.completion
      -- local diagnosttics = null_ls.builtins.diagnostics
      null_ls.setup {
        sources = {
          formatting.stylua,
          formatting.prettierd,
        },
      }
    end,
  },
  {
    'windwp/nvim-ts-autotag',
  },
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    config = function(_, opts)
      require('gopher').setup(opts)
      vim.keymap.set('n', '<leader>gsj', '<cmd>GoTagAdd json<CR>', { desc = 'Add json struct tags' })
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    event = 'VeryLazy',
    opts = {
      symbol = '▏',
      -- symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    opts = {},
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end,
  },
}
