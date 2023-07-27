require("flutter-tools").setup {
  lsp = {
    settings = {
      analysisExcludedFolders = { vim.fn.expand("$HOME/flutter/packages") }
    }
  }
} -- use defaults
