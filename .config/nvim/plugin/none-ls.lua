local null_ls = require('null-ls')
local builtins = null_ls.builtins

null_ls.setup {
  sources = {
    builtins.formatting.black,
    builtins.formatting.isort,
    builtins.formatting.clang_format,
    builtins.formatting.dfmt,
    builtins.formatting.stylua,
    builtins.formatting.prettierd,
  }
}
