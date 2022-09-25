local bind = vim.keymap.set
vim.g.mapleader = ' '
-- Leader
bind('n', '<Space>', '<NOP>', { noremap = true, silent = true})

-- No hl
bind('n', '<Leader>s', ':nohl<CR>', { noremap = true, silent = true})

-- Window movement
bind('n', '<C-h>', '<C-w>h', { noremap = true })
bind('n', '<C-j>', '<C-w>j', { noremap = true })
bind('n', '<C-k>', '<C-w>k', { noremap = true })
bind('n', '<C-l>', '<C-w>l', { noremap = true })
bind('n', '<C-q>', '<C-w>q', { noremap = true })

-- Nice intendings
bind('v', '<', '<gv', { noremap = true, silent = true})
bind('v', '>', '>gv', { noremap = true, silent = true})

bind('n', '!', ':!', { noremap = true} )

-- build
bind('n', '<f4>', ':make<CR>', { noremap = true} )

--Quickfixlist
bind('n', '<C-Down>', '<cmd>cnext<cr>', { noremap = true, silent = true})
bind('n', '<C-Up>', '<cmd>cprevious<cr>', { noremap = true, silent = true})

-- Source
bind('n', '<Leader><Leader>', ':lua package.loaded.init = nil<cr>:source $MYVIMRC<CR>', { noremap = true, desc = "Source main configuration file" })

-- Window moving
bind('n', '<M-j>', ':resize -2<CR>', { noremap = true, silent = true})
bind('n', '<M-k>', ':resize +2<CR>', { noremap = true, silent = true})
bind('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true, silent = true})
bind('n', '<M-l>', ':vertical resize +2<CR>', { noremap = false, silent = true})
bind('n', '<M-;>', '<C-w>=', { noremap = false, silent = true})

-- Telescope
bind('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { noremap = false, silent = true})
bind('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = false, silent = true})
bind('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { noremap = false, silent = true})
bind('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = false, silent = true})
bind('n', '<Leader>gc', '<cmd>Telescope git_commits<cr>', { noremap = false, silent = true})
bind('n', '<Leader>gs', '<cmd>Telescope git_stash<cr>', { noremap = false, silent = true})
bind('n', '<Leader>gb', '<cmd>Telescope git_branches<cr>', { noremap = false, silent = true})
bind('n', '<Leader>gg', '<cmd>Telescope git_bcommits<cr>', { noremap = false, silent = true})
bind('n', '<Leader>en', '<cmd>Telescope find_files cwd=~/.config/nvim<cr>', { noremap = false, silent = true})
bind('n', '<C-_>', '<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>', { noremap = false, silent = true})
bind('n', '<C-f>', '<cmd>Telescope git_files<cr>', { noremap = false, silent = true})

-- NvimTree
bind('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = false, silent = true})
bind('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = false, silent = true})
bind('n', '<Leader>n', ':NvimTreeFindFile<CR>', { noremap = false, silent = true})

-- Bufferline
bind('n', '<Leader>c', ':up|Bdelete<CR>', { noremap = false, silent = true})
bind('n', '<S-l>', ':BufferLineCycleNext<CR>', { noremap = false, silent = true})
bind('n', '<S-h>', ':BufferLineCyclePrev<CR>', { noremap = false, silent = true})

bind('n', '<Leader>l', vim.lsp.buf.formatting, { noremap = false, silent = true, desc = "Formating"})
