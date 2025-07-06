vim.cmd("let g:netrw_banner = 0")

-- Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs
local tabsize = 2
vim.opt.tabstop = tabsize
vim.opt.softtabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Saves
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 2025 defaults
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "auto"

vim.opt.foldenable = true
vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "0"

vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.splitright = true
vim.opt.splitbelow = false -- Split un top always

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "0" -- do not need to show where is 80th column

vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true

vim.opt.mouse = "a"

vim.g.editorconfig = true

 -- Autosave on FocusLost
vim.api.nvim_create_autocmd("FocusLost", {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    local modifiable = vim.api.nvim_buf_get_option(buf, "modifiable")

    if name ~= "" and modifiable then
      vim.api.nvim_command("silent! write")
    end
  end
})
