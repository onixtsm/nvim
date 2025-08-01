return {
	"ellisonleao/gruvbox.nvim", priority = 1000, config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
		vim.o.background = "dark"
		vim.cmd.colorscheme("gruvbox")
        vim.opt.cursorline = true
        vim.opt.termguicolors = true
        vim.cmd("highlight clear CursorLine")
        vim.cmd("highlight CursorLine gui=underline cterm=underline")

	end
}

--[[ return { "ellisonleao/gruvbox.nvim", priority = 1000 ,
  config = function()
    require("gruvbox").setup({
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        folds = false,
        operators = false,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "",  -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {
        Pmenu = { bg = "" }, -- Completion menu background
      },
      dim_inactive = false,
      transparent_mode = true,
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}
]]
