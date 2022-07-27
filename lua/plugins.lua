
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

return require('packer').startup(function()
-- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

-- LSP
  use 'neovim/nvim-lspconfig'

-- Completion
  use 'hrsh7th/nvim-cmp'

-- nvim-cmp dependencies
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'

-- Devicons
  use 'kyazdani42/nvim-web-devicons'

-- Snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions

-- Debugging
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

--  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

-- Bottom line
  use 'nvim-lualine/lualine.nvim'

-- A fuzzyfinder
  use 'nvim-telescope/telescope.nvim'
-- Dependencies for better usage
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

-- Automaticly close brackets
  use 'windwp/nvim-autopairs'

-- Show colors of hex (#FFF)
  use 'norcalli/nvim-colorizer.lua'

-- File manager
  use 'kyazdani42/nvim-tree.lua'

--  use 'lewis6991/gitsigns.nvim'

  use 'akinsho/bufferline.nvim'
  use 'moll/vim-bbye'

--  use 'folke/which-key.nvim'
-- Comments
  use 'numToStr/Comment.nvim'
-- Comments for ts (.jsx)
--  use 'JoosepAlviste/nvim-ts-context-commentstring'
-- Auto close tag (requires treesitter)
-- use 'windwp/nvim-ts-autotag'
  -- Theme
  use 'gruvbox-community/gruvbox'
  use 'xiyaowong/nvim-transparent'

end)
