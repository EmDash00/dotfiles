local vimp = require('vimp')
local nnoremap = vimp.nnoremap

local opts = {'silent'}

nnoremap(opts, '<C-p>', '<Plug>MarkdownPreview')
