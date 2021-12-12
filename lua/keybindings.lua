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

-- Terminal
bind('n', '!', ':!', { noremap = true} )


bind('c', 'w!!', '!sudo tee > /dev/null %', {})

-- Source
bind('n', '<Leader><Leader>', ':source $MYVIMRC<CR>', { noremap = true })


bind('n', '<M-j>', ':resize -2<CR>', { noremap = true, silent = true})
bind('n', '<M-k>', ':resize +2<CR>', { noremap = true, silent = true})
bind('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true, silent = true})
bind('n', '<M-l>', ':vertical resize +2<CR>', { noremap = false, silent = true})
