vim.opt_local.textwidth = 80
vim.opt_local.spell = true
vim.opt_local.linebreak = true

local cmp = require("cmp")
vim.notify("LaTeX ftplugin loaded!", vim.log.levels.INFO)
cmp.setup.buffer({
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "lazydev" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "latex_symbols", option = { strategy = 2 } },
  }),
})
