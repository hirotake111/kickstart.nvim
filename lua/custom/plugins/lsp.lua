local lspconfig = require 'lspconfig'

lspconfig.gleam.setup {}

lspconfig.docker_compose_language_service.setup {}
-- A workaround for not detecting docker-compose.yaml file type correctly
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = { 'docker-compose.yaml', 'docker-compose.yml' },
  callback = function()
    vim.bo.filetype = 'yaml.docker-compose'
  end,
})

return {}
