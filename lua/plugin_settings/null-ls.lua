local null_ls = require("null-ls")

null_ls.setup({
	sources = {
    null_ls.builtins.formatting.stylua.with({ extra_args = { '--column-width 80', '--quote-style AutoPreferSingle', '--indent-type Spaces'}}),
    null_ls.builtins.formatting.prettier.with({ extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote'}}),
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.formatting.fixjson.with({ extra_args = {'--indent 2'}}),
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.cmake_format,
    null_ls.builtins.formatting.trim_whitespace,
	},
})
