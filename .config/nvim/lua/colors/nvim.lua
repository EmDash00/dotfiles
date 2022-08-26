local highlights = {
  MatchParen = {cterm = {bold = true}, ctermfg=168, ctermbg=16, fg='#e06c75', bold=true},
--MatchParen     xxx cterm=bold,underline ctermfg=168 ctermbg=16 gui=bold,underline guifg=#e06c75
  FloatBorder = {ctermfg=16, ctermbg=16, fg='#5c6370', bg='#282c34'},
  NormalFloat = {ctermfg=16, ctermbg=16, bg='#282c34'},
  VertSplit = {ctermfg=16, ctermbg=16, fg='#3b4048', bg='#282c34'},
}

require('colors').set_hls(highlights)
