return {
  install_script = [[
  wget -O vscode.tar.gz https://update.code.visualstudio.com/latest/linux-x64/stable
  rm -rf vscode
  mkdir vscode
  tar -xzf vscode.tar.gz -C vscode --strip-components 1
  rm vscode.tar.gz

  rm -rf vscode-emmet
  mkdir vscode-emmet
  cp -r vscode/resources/app/extensions/node_modules vscode-emmet
  cp -r vscode/resources/app/extensions/emmet vscode-emmet

  rm -rf vscode
  ]],

  default_config = {
    cmd = {'node', './vscode-emmet/emmet/dist/node/emmetNodeMain.js', '--stdio'},
    filetypes = {'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
    root_dir = require'lspconfig'.util.root_pattern('.git', vim.fn.getcwd())
    -- init_options = {provideFormatter = true}
  }
}
