local lspconfig = require('lspconfig')
local bind = vim.keymap.set
local loading_function = function()
  bind('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
  bind('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
  bind('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
  bind('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
  bind('n', 'ga', vim.lsp.buf.code_action, { buffer = 0 })
  bind('n', '<leader>r', vim.lsp.buf.rename, { buffer = 0 })
  bind('n', '<leader>dj', vim.diagnostic.goto_next, { buffer = 0 })
  bind('n', '<leader>dk', vim.diagnostic.goto_prev, { buffer = 0 })
  bind('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', { buffer = 0 })
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = loading_function(),
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.solargraph.setup {
  capabilities = capabilities,
  on_attach = loading_function(),
  settings = {
    solorgraph = {
      autoformat = true
    }
  }
}
-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = loading_function(),
}

-- npm i -g vscode-langservers-extracted
lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = loading_function(),
}


lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = loading_function(),
}

--[[ lspconfig.ccls.setup {

  -- root_dir = lspconfig.util.root_pattern("compile_commands.json", ".ccls", ".git", "Makefile", "build.sh");
  capabilities = capabilities,
  on_attach = loading_function(),
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math" };
    };
  }
} ]]

lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = loading_function(),
  cmd = {'clang', '--header-insertion=true'}
}

-- TODO: add Java

lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = loading_function()
  --root_dir = lspconfig.util.root_pattern("go.mod", "build/", ".git", "Makefile", "build.sh");
}
