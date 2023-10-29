local bind = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Leader
bind('n', '<Space>', '<NOP>', { noremap = true, silent = true })

bind('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
bind('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Window movement
bind('n', '<C-h>', '<C-w>h', { noremap = true })
bind('n', '<C-j>', '<C-w>j', { noremap = true })
bind('n', '<C-k>', '<C-w>k', { noremap = true })
bind('n', '<C-l>', '<C-w>l', { noremap = true })
bind('n', '<C-q>', '<C-w>q', { noremap = true })

-- Nice intendings
bind('v', '<', '<gv', { noremap = true, silent = true })
bind('v', '>', '>gv', { noremap = true, silent = true })

-- build
bind('n', '<f4>', ':make<CR>', { noremap = true, desc = "Make" })

--Quickfixlist
bind('n', '<C-Down>', '<cmd>cnext<cr>', { noremap = true, silent = true })
bind('n', '<C-Up>', '<cmd>cprevious<cr>', { noremap = true, silent = true })

-- Window moving
bind('n', '<M-j>', ':resize -2<CR>', { noremap = true, silent = true })
bind('n', '<M-k>', ':resize +2<CR>', { noremap = true, silent = true })
bind('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true, silent = true })
bind('n', '<M-l>', ':vertical resize +2<CR>', { noremap = false, silent = true })
bind('n', '<M-;>', '<C-w>=', { noremap = false, silent = true })

-- Diagnostic keymaps
bind('n', '[d', vim.diagnostic.goto_next, { buffer = 0, desc = "Diagnostic go to next" })
bind('n', ']d', vim.diagnostic.goto_prev, { buffer = 0, desc = "go to previous" })
bind('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostics' })
bind('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics' })
bind('n', '<C-Down>', vim.diagnostic.goto_next, { noremap = true, silent = true })
bind('n', '<C-Up>', vim.diagnostic.goto_prev, { noremap = true, silent = true })

-- git
bind('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })

--cmp
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup {
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
}

-- DAP
bind('n', '<F5>', function() require('dap').continue() end, { desc = 'DAP continue' })
bind('n', '<F10>', function() require('dap').step_over() end, { desc = 'DAP stepover' })
bind('n', '<F11>', function() require('dap').step_into() end, { desc = 'DAP step into' })
bind('n', '<F12>', function() require('dap').step_out() end, { desc = 'DAP step out' })
bind('n', '<Leader>dr', function() require('dap').repl.toggle() end, { desc = 'DAP open REPL' })
bind('n', '<Leader>dl', function() require('dap').run_last() end, { desc = 'DAP run last' })
bind('n', '<Leader>bb', function() require('dap').toggle_breakpoint() end, { desc = 'DAP toggle breakpoint' })
bind('n', '<Leader>bB', function()
  require('dap').toggle_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = "toggle conditional breakpoint" })
bind('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
  { desc = 'DAP breakpoint with log message' })
bind({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end, { desc = 'DAP hover' })
bind({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end, { desc = 'DAP widgets preview' })
bind('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end, { desc = 'DAP widgets frames' })
bind('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end, { desc = 'DAP widgets scopes' })

--lsp
--
-- telescope
bind('n', '<Leader>gc', require('telescope.builtin').git_commits, { desc = '[G]it [C]ommits' })
bind('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
bind('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
bind('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
bind('n', '<leader>sc', require('telescope.builtin').live_grep, { desc = '[S]earch by [C]hars (grep)' })
bind('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
bind('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch [G]it' })
bind('n', '<leader>bf', require('telescope').extensions.file_browser.file_browser, { desc = '[B]rowse [F]iles' })

