require'telescope'.setup {
  pickers = {
    find_files = {
      theme = 'ivy'
    },
    live_grep ={
      theme = 'ivy'
    }
  }
}

require('telescope').load_extension('fzf')
