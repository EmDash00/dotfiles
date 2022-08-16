local cmd = vim.cmd
local api = vim.api

api.nvim_create_autocmd(
  'ColorScheme', 
  {
    pattern = '*',
    callback = function()
      cmd 'highlight FloatBorder ctermfg=16 ctermbg=16 guifg=#5c6370 guibg=#282c34'
      cmd 'highlight NormalFloat ctermfg=16 ctermbg=16 guibg=#282c34'
    end
  }
)
