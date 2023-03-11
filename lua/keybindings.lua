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
bind('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostics' } )
bind('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics' })
bind('n', '<C-Down>', vim.diagnostic.goto_next, { noremap = true, silent = true })
bind('n', '<C-Up>', vim.diagnostic.goto_prev, { noremap = true, silent = true })

-- git
bind('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
