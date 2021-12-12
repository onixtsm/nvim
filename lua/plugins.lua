
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Native LSP I guess
  use 'hrsh7th/nvim-cmp'

  -- nvim-cmp dependencies
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'


  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'nvim-telescope/telescope.nvim'

  use 'norcalli/nvim-colorizer.lua'

  -- Theme
  use 'gruvbox-community/gruvbox'

end)
