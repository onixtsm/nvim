local lspconfig = require('lspconfig')

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


--local sumneko_root_path = '~/.config/nvim/lua-language-server'
--local sumenko_binary = sumneko_root_path..'/bin/'..Linux..'/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
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
        globals = {'vim'},
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

lspconfig.solargraph.setup{
  capabilities = capabilities,
  settings = {
    solorgraph = {
      autoforamt = true
    }
  }
}

lspconfig.tsserver.setup {
  capabilities = capabilities,

}

lspconfig.cssls.setup {
  capabilities = capabilities,
}

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
  capabilities = capabilities,
}

lspconfig.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".ccls", ".git", "Makefile", "build.sh")
  }
}

-- TODO: add Java

lspconfig.gopls.setup{}
