local bind = vim.keymap.set
local dap = require('dap')
local dapui = require('dapui')
bind('n', '<F5>', dap.continue, {desc = "Start/Continue debugging"})
bind('n', '<F6>', dapui.toggle, {desc = "Toggle dapui"})
bind('n', '<F10>', dap.step_over, {desc = "Restart debuging"})
bind('n', '<F11>', dap.step_into, {desc = "Step into function or method"})
bind('n', '<F12>', dap.step_out, {desc = "Step out of function or method"})
bind('n', '<leader>b', dap.toggle_breakpoint, {desc = "Set breakpoint"})
bind('n', '<leader>B', function ()
  dap.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))
end, {desc = "toggle breakpoint"})

