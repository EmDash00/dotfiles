local bgcolor = require('colors').bgcolor
local highlights = {
  MatchParen = { cterm = { bold = true }, ctermfg = 168, ctermbg = 16, fg = '#e06c75', bold = true },
  FloatBorder = { ctermfg = 16, ctermbg = 16, fg = '#5c6370', bg = bgcolor },
  NormalFloat = { ctermfg = 16, ctermbg = 16, bg = bgcolor },
  VertSplit = { ctermfg = 16, ctermbg = 16, fg = '#3b4048', bg = bgcolor },
}

require('colors').set_hls(highlights)
