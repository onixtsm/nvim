local v = vim.o
local cmd = vim.cmd

v.clipboard = v.clipboard .. 'unnamedplus'

v.number = true
v.nu = true
cmd('set relativenumber')
v.ruler = true

v.encoding = 'utf-8'
v.fileencoding = 'utf-8'
v.exrc = true 			--execute local init.vim or init.lua

v.hlsearch = true
v.incsearch = true
v.ignorecase = true
v.smartcase = true

v.hidden = true
v.swapfile = false
v.backup = false
v.showmode = false
v.writebackup = false

v.pumheight = 10                        --Makes popup menu smaller
v.scrolloff = 6
v.cmdheight = 2                         --More space for displaying messages
v.laststatus = 0
v.conceallevel = 2
v.showtabline = 2

v.mouse = 'a'
v.whichwrap = v.whichwrap .. '<,>,[,],h,l'

v.expandtab = true                          -- Converts tabs to spaces
v.smartindent = true                        -- Makes indenting smart
v.autoindent = true                    -- Good auto indent
v.tabstop = 2
v.shiftwidth = 2

v.splitright = true
v.splitbelow = false

v.updatetime = 300
v.timeoutlen = 500 -- no whickkey v.timeoutlen = 500

v.autowrite = true

v.list = false
v.wrap = true
v.linebreak = true
v.compatible = false

v.wildmenu = true
v.path = v.path..'**'
v.makeprg = './build.sh'


cmd(':au FocusLost * :wa')
cmd(':set iskeyword+=-')


-- Theme
v.cursorline = true
v.background = 'dark'
v.termguicolors = true
cmd('colorscheme gruvbox')
cmd('highlight Normal guibg=none ctermbg=none')
cmd('highlight clear CursorLine')
cmd('highlight CursorLine gui=underline cterm=underline')


