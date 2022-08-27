local null_ls = require('null-ls')
local builtins = null_ls.builtins

null_ls.setup {
  sources = {
    builtins.formatting.autopep8,
    builtins.formatting.isort,
    builtins.formatting.clang_format,
    builtins.formatting.dfmt,
    builtins.formatting.lua_format,
    builtins.formatting.prettierd,
  }
}

print('done')
