vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- use { "catppuccin/nvim", as = "catppuccin" }
  use 'AlexvZyl/nordic.nvim'

  -- use { "sainnhe/gruvbox-material", {
  -- opt = true,
  -- config = function()
  -- vim.g.gruvbox_material_background = 'medium'
  -- vim.g.gruvbox_material_palette = 'original'
  -- vim.g.gruvbox_material_enable_bold = 1
  -- vim.g.gruvbox_material_enable_italic = 1
  -- vim.g.gruvbox_material_sign_column_background = 'none'
  -- vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
  -- vim.cmd 'colorscheme gruvbox-material'
  --end
  -- } }
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-telescope/telescope-file-browser.nvim')
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('m4xshen/hardtime.nvim')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
    }
  }
  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')

  use('glepnir/lspsaga.nvim')
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use 'simrat39/rust-tools.nvim'
end)
