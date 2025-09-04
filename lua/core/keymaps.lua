local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center after page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center after page up" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dp', opts)

vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "No clip delete" })
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "clear search", silent = true })

vim.keymap.set("n", "<leader>l", vim.lsp.buf.format)

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "x", '"_x', opts)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word cursor is on globally" })

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

--split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:/")                -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath)                         -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>.", function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible
  })
end, { desc = "Toggle LSP diagnostics" })

vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)
