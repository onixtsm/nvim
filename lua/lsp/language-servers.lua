local setContains = function(set, value)
  local contains = false
  for _, v in pairs(set) do
    if type(value) == 'string' then
      if v == value then contains = true end
      return contains
    end
    for _, z in pairs(value) do
      if v == z then contains = true end
      return contains
    end
  end
end

local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  if (client.server_capabilities.documentHighlightProvider) then
    vim.cmd [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.cmd [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.cmd [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
  end
  if client.server_capabilities.hoverProvider then
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  end
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('<C-m>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<Leader>f', vim.lsp.buf.format, '[F]format')

  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  if client.config.root_dir ~= nil then
    vim.api.nvim_set_current_dir(client.config.root_dir)
  end

  print(setContains(client.config.filetypes, { "c", "cpp" }))

  local build_files = {
    { "build.sh",                                        "./build.sh" },
    { "Makefile",                                        "make" },
    { { "c", "cpp", "objc", "objcpp", "cuda", "proto" }, "make" },
  }

  for _, v in pairs(build_files) do
    if vim.fn.findfile(v[1], client.config.root_dir .. ';') or setContains(client.config.filetypes, v[1]) then
      vim.o.makeprg = v[2]
      break
    end
  end
end

-- Setup lspconfig.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

local params = {
  ran = false,
  executable = '',
  args = ''
}
require('dapui').setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  params.ran = false
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  params.ran = false
end

local get_args = function()
  local argument_string = vim.fn.input({ prompt = 'Program arguments: ' })
  return vim.fn.split(argument_string, " ", true)
end

local get_executable = function()
  return vim.fn.input({ prompt = 'Path to executable: ' .. vim.fn.getcwd() .. '/', completion = 'file' })
end

require("mason-nvim-dap").setup({
  automatic_setup = true,
  handlers = {
    function(source_name)
      -- all sources with no handler get passed here
      -- Keep original functionality of `automatic_setup = true`
      require('mason-nvim-dap.automatic_setup')(source_name)
    end,
    cppdbg = function(source_name)
      dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = 'OpenDebugAD7',
      }

      dap.configurations.c = {
        {
          name = 'Launch file',
          type = 'cppdbg',
          request = 'launch',
          program = function()
            if (not params.ran) then
              params.executable = get_executable()
              params.args = get_args()
              params.ran = true
            end
            return params.executable
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = true,
          args = function()
            if (not params.ran) then
              params.executable = get_executable()
              params.args = get_args()
              params.ran = true
            end
            return params.args
          end
        },
        {
          name = 'Attach to gdbserver :1234',
          type = 'cppdbg',
          request = 'launch',
          MIMode = 'gdb',
          miDebuggerServerAddress = 'localhost:1234',
          miDebuggerPath = '/usr/bin/gdb',
          cwd = '${workspaceFolder}',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
        },
      }
    end,
  }
})

require('telescope').load_extension('dap')

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()
