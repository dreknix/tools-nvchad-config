local base = require('plugins.configs.lspconfig')

local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

lspconfig.ansiblels.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.docker_compose_language_service.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'yaml.docker-compose'},
})

lspconfig.dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.marksman.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'yaml', 'yaml.ansible', 'yaml.docker-compose'},
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'python'},
})

lspconfig.texlab.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
