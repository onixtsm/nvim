require("mason-nvim-dap").setup({
  automatic_setup = true,
  handlers = {}
})

vim.api.nvim_create_user_command('Close', ':lua require("dapui").close()', {})

vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})

