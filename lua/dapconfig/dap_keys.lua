local bind = vim.keymap.set
local dap = require('dap')
bind('n', '<F5>', dap.continue)
bind('n', '<F10>', dap.step_over)
bind('n', '<F11>', dap.step_into)
bind('n', '<F12>', dap.step_out)
bind('n', '<F12>', dap.step_out)
bind('n', '<leader>b', dap.toggle_breakpoint)
bind('n', '<leader>B', function ()
  dap.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

