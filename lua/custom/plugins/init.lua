-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  -- 'trouble.lua',
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- 'none-ls.lua',
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
          formatting.ocamlformat,
          -- formatting.taplo,
        },
      }
    end,
  },
  -- 'gopher.lua',
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    config = function(_, opts)
      require('gopher').setup(opts)
      vim.keymap.set('n', '<leader>gjs', '<cmd>GoTagAdd json<CR>', { desc = '[G]oTagAdd [J]son [S]truct' })
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  -- 'mini-indent.lua',
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
  -- Rust
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  -- 'harpoon.lua',
  {
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
  },
}
