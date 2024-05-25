return {
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
}
