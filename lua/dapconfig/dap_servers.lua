require 'dap-go'.setup()

local dap = require('dap')
-- https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/onix/.local/bin/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    targetArchitecture ="x86_64",
    program = function()
      return "${fileBasenameNoExtension}"
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
    MIDebuggerPath = '/usr/bin/gdb',
    MIDebuggerArgs = '-q',
    logging = {
      moduleLoad = false,
      programOutput = false,
      trace = false,
      traceResponse = false,
      engineLogging = false
    },

  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


dap.adapters.ruby = {
  type = 'executable';
  command = 'bundle';
  args = {'exec', 'readapt', 'stdio'};
}

dap.configurations.ruby = {
  {
    type = 'ruby';
    request = 'launch';
    name = 'Rails';
    program = 'bundle';
    programArgs = {'exec', 'rails', 's'};
    useBundler = true;
  },
}
