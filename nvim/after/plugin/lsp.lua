local lsp = require("lsp-zero")
local lsp_config = require("lspconfig")
local mason = require('mason')
local mason_lsp_config = require("mason-lspconfig")
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.preset("recommended")
lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
})

-- lsp.configure('lua-language-server', {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim '}
--       }
--     }
--   }
-- })


require'lspconfig'.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascriptreact", "javascript" },
  cmd = { "typescript-language-server", "--stdio" },
}

-- -- Call the language servers you have installed
-- require('lspconfig').tsserver.setup({
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascriptreact", "javascript" },
--   cmd = { "typescript-language-server", "--stdio" },
--   root_dir = function() return vim.loop.cwd() end
-- })
--

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = "I"
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "dv", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "J", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "N", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "H", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

lsp_config["dartls"].setup({
  on_attach = on_attach,
  root_dir = lsp_config.util.root_pattern('.git'),
  settings = {
    dart = {
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
        vim.fn.expand("$HOME/.pub-cache"),
        vim.fn.expand("/opt/homebrew/"),
        vim.fn.expand("$HOME/tools/flutter/"),
      },
      updateImportsOnRename = true,
      completeFunctionCalls = true,
      showTodos = true,
    }
  },
})


mason.setup()
mason_lsp_config.setup()

-- -- Call the language servers you have installed
-- require('lspconfig').tsserver.setup({
--   on_attach = on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascriptreact", "javascript" },
--   cmd = { "typescript-language-server", "--stdio" },
--   capabilities = capabilities,
--   root_dir = function() return vim.loop.cwd() end
-- })
--
--
-- cmp.setup({
--   mapping = {
--     -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
--   }
-- })
--
--
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })
--
-- local enable_format_on_save = function(_, bufnr)
--   vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
--   vim.api.nvim_create_autocmd("BufWritePre", {
--     group = augroup_format,
--     buffer = bufnr,
--     callback = function()
--       vim.lsp.buf.format({ bufnr = bufnr })
--     end,
--   })
-- end
--
--
-- lsp.on_attach(function(client, bufnr)
--   local opts = { buffer = bufnr, remap = false }
--
--   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--   vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
--   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--   vim.keymap.set("n", "dv", function() vim.diagnostic.open_float() end, opts)
--   vim.keymap.set("n", "J", function() vim.diagnostic.goto_next() end, opts)
--   vim.keymap.set("n", "N", function() vim.diagnostic.goto_prev() end, opts)
--   vim.keymap.set("n", "H", function() vim.lsp.buf.code_action() end, opts)
--   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
-- end)
--

--
-- vim.o.updateTime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
--
--
-- lsp.setup()
--
-- vim.diagnostic.config({
--   virtual_text = true
-- })
