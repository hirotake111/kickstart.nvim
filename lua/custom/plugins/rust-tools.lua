return {
  'simrat39/rust-tools.nvim',
  dependencies = 'neovim/nvim-lspconfig',
  opts = {},
  config = function(_, opts)
    require('rust-tools').setup(opts)
  end,
}
