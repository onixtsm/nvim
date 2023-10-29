local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()

local kind_icons = {
  Text = "󰊄",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "󰆧",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet
--
local t = luasnip.text_node
local i = luasnip.insert_node
local s = luasnip.snippet
local fmta = require("luasnip.extras.fmt").fmta
luasnip.add_snippets("c", {
  s("main", fmta([[
    int main(<args>) {
      printf("Hello, seaman\n");
      return 0;
    }
  ]], {
    args = i(1, "int argc, char **argv")
  })
  )
})

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      --vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer", keyword_length = 5, max_item_count = 5 },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  widnow = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}
