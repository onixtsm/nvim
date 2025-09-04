return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
        -- "saghen/blink.cmp",
    },
    config = function()
        -- import mason and mason_lspconfig
        local mason = require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- NOTE: Moved these local imports below back to lspconfig.lua due to mason depracated handlers

        -- local lspconfig = require("lspconfig")
        -- local cmp_nvim_lsp = require("cmp_nvim_lsp")             -- import cmp-nvim-lsp plugin
        -- local capabilities = cmp_nvim_lsp.default_capabilities() -- used to enable autocompletion (assign to every lsp server config)

        -- enable mason and configure icons

        mason_lspconfig.setup({
            automatic_enable = false,
            -- servers for mason to install
            ensure_installed = {
                "lua_ls",
                -- "ts_ls", currently using a ts plugin
                "html",
                "tailwindcss",
                "emmet_ls",
                "emmet_language_server",
                "eslint",
                "marksman",
                "gopls"
            },

        })

            --
            -- NOTE: mason BREAKING Change! Removed setup_handlers
            -- moved lsp configuration settings back into lspconfig.lua file
    end,
}
