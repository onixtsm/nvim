require 'telescope'.setup {
  pickers = {
    find_files = {
      theme = 'ivy'
    },
   live_grep = {
      theme = 'ivy'
    }
  }
}
pcall(require('telescope').load_extension, 'fzf')
require("telescope").load_extension "file_browser"

require('telescope').load_extension('dap')
