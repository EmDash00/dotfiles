local opt = vim.opt
local cmd = vim.cmd

require('plugins')

opt.expandtab = true
opt.showmode = false
opt.hidden = true

opt.number = true
opt.backspace = {'indent', 'eol', 'start'}
opt.laststatus = 2
opt.tabstop = 2
opt.shiftwidth = 2
opt.signcolumn = 'number'
opt.termguicolors = true
opt.cursorline = true

opt.clipboard = 'unnamedplus'

opt.guicursor = 
  'a:blinkwait500-blinkon300-blinkoff200,' ..
  'i-ci:ver30-blinkwait500-blinkon300-blinkoff200'

opt.background = 'dark'
cmd 'colorscheme one'
