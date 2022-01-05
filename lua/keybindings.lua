local bind = vim.api.nvim_set_keymap

-- Leader
bind('n', '<Space>', '<NOP>', { noremap = true, silent = true})
vim.g.mapleader = ' '

-- No hl
bind('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true})

-- Window movement
bind('n', '<C-h>', '<C-w>h', { noremap = true })
bind('n', '<C-j>', '<C-w>j', { noremap = true })
bind('n', '<C-k>', '<C-w>k', { noremap = true })
bind('n', '<C-l>', '<C-w>l', { noremap = true })

-- Nice intendings
bind('v', '<', '<gv', { noremap = true, silent = true})
bind('v', '>', '>gv', { noremap = true, silent = true})

bind('n', '!', ':!', { noremap = true} )


bind('c', 'w!!', '!sudo tee > /dev/null %', {})

-- Source
bind('n', '<Leader><Leader>', ':source $MYVIMRC<CR>', { noremap = true })

-- Window moving
bind('n', '<M-j>', ':resize -2<CR>', { noremap = true, silent = true})
bind('n', '<M-k>', ':resize +2<CR>', { noremap = true, silent = true})
bind('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true, silent = true})
bind('n', '<M-l>', ':vertical resize +2<CR>', { noremap = false, silent = true})

-- Telescope
bind('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { noremap = false, silent = true})
bind('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = false, silent = true})
bind('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { noremap = false, silent = true})
bind('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = false, silent = true})
bind('n', '<Leader>gc', '<cmd>Telescope git_commits<cr>', { noremap = false, silent = true})
bind('n', '<Leader>gs', '<cmd>Telescope git_stash<cr>', { noremap = false, silent = true})
bind('n', '<Leader>gb', '<cmd>Telescope git_branches<cr>', { noremap = false, silent = true})

-- NvimTree
bind('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = false, silent = true})
bind('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = false, silent = true})
bind('n', '<Leader>n', ':NvimTreeFindFile<CR>', { noremap = false, silent = true})

-- Bufferline
bind('n', '<Leader>c', ':w|Bdelete<CR>', { noremap = false, silent = true})
bind('n', '<S-l>', ':BufferLineCycleNext<CR>', { noremap = false, silent = true})
bind('n', '<S-h>', ':BufferLineCyclePrev<CR>', { noremap = false, silent = true})

bind('n', '<Leader>l', ':lua vim.lsp.buf.formatting_sync()<CR>', { noremap = false, silent = true})
