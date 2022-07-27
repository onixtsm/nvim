require'nvim-treesitter.configs'.setup {

ensure_installed = "all",

  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  },
}
