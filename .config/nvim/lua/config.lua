local opt = vim.opt

vim.g.loaded_netrw = false

require('colors')
require('autofuncs')
require('plugins')
require('surround')
require('keymaps')


opt.termguicolors = true

opt.expandtab = true
opt.showmode = false
opt.hidden = true

opt.cursorline = true
opt.number = true
opt.signcolumn = 'number'

opt.backspace = { 'indent', 'eol', 'start' }
opt.laststatus = 2

opt.enc = 'utf-8'
opt.fenc = 'utf-8'
opt.termencoding = 'utf-8'

opt.tabstop = 2
opt.shiftwidth = 2

opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 10

opt.signcolumn = 'auto'

opt.clipboard = 'unnamedplus'

opt.guicursor =
  'a:blinkwait500-blinkon300-blinkoff200,' ..
  'i-ci:ver30-blinkwait500-blinkon300-blinkoff200'

local onedark = require('onedark')


onedark.setup {
  ending_tildes = false,
}

onedark.load()
