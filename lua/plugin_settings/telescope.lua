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

vim.keymap.set('n', '<Leader>gc', require('telescope.builtin').git_commits, { desc = '[G]it [C]ommits' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').live_grep, { desc = '[S]earch by [C]hars (grep)' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch [G]it' })
vim.keymap.set('n', '<leader>bf', require('telescope').extensions.file_browser.file_browser, { desc = '[B]earch [F]iles' })
