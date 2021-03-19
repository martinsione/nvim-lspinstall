local config = require'lspconfig'.pyright.document_config
require'lspconfig/configs'.pyright = nil -- important, immediately unset the loaded config again
config.default_config.cmd[1] = "./node_modules/.bin/pyright-langserver"

return vim.tbl_extend('error', config, {
  install = [[
  ! -f package.json && npm init -y --scope=lspinstall || true
  npm install pyright@latest
  ]]
})