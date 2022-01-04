
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Completion
  use 'hrsh7th/nvim-cmp'

  -- nvim-cmp dependencies
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'David-Kunz/cmp-npm'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'kyazdani42/nvim-web-devicons'

  -- Snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'nvim-lualine/lualine.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'windwp/nvim-autopairs'

  use 'norcalli/nvim-colorizer.lua'

  use 'kyazdani42/nvim-tree.lua'

  use 'lewis6991/gitsigns.nvim'

  use 'akinsho/bufferline.nvim'
  use 'moll/vim-bbye'

  -- Theme
  use 'gruvbox-community/gruvbox'

end)
